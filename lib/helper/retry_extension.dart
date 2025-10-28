import 'dart:math';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:math' show pow;

/// Configuration class for retry behavior.
///
/// This class provides the configuration for retrying a function with exponential backoff.
/// It includes settings for the maximum number of retries, the delay between retries,
/// and the backoff factor that controls how the delay grows with each retry attempt.
class RetryConfig {
  final int maxRetries;
  final Duration delay;
  final double backoffFactor;

  const RetryConfig({
    required this.maxRetries,
    required this.delay,
    required this.backoffFactor,
  });

  /// Calculates the delay for a specific retry attempt based on the backoff factor.
  ///
  /// The delay increases exponentially with each retry attempt according to the backoff factor.
  ///
  /// Parameters:
  /// - [attempt]: The current retry attempt (starting from 1).
  ///
  /// Returns:
  /// - A [Duration] representing the delay for the current attempt.
  Duration getDelayForAttempt(int attempt) {
    return Duration(
      milliseconds:
          (delay.inMilliseconds * pow(backoffFactor, attempt - 1)).toInt(),
    );
  }
}

extension RetryExtension<T> on Ref<T> {
  /// Creates a function that wraps a callback with retry behavior.
  ///
  /// This function attempts to execute a given callback function. If it fails, it will retry
  /// the function according to the configuration provided. The retry logic applies exponential
  /// backoff for the delay between retries.
  ///
  /// Parameters:
  /// - [maxRetries]: The maximum number of retry attempts.
  /// - [delay]: The initial delay before the first retry.
  /// - [backoffFactor]: The factor by which the delay increases after each retry.
  ///
  /// Returns:
  /// - A function that wraps the callback with retry logic. This function retries the callback 
  ///   in case of failure, with a delay that grows exponentially according to the configuration.
  Future<R> Function(Future<R> Function()) withRetryFunction<R>({
    required int maxRetries,
    required Duration delay,
    required double backoffFactor,
  }) {
    final config = RetryConfig(
      maxRetries: maxRetries,
      delay: delay,
      backoffFactor: backoffFactor,
    );

    return (Future<R> Function() callback) async {
      int attempts = 0;
      Object? lastError;
      StackTrace? lastStack;
      
      // Loop to retry the callback until maxRetries is reached
      while (attempts < config.maxRetries) {
        try {
          return await callback(); // Try executing the callback
        } catch (error, stack) {
          attempts++; // Increment attempt counter
          lastError = error;
          lastStack = stack;

          // If max retries reached, throw the last error
          if (attempts == config.maxRetries) {
            Error.throwWithStackTrace(lastError, lastStack);
          }

          // Wait for the delay before retrying
          await Future.delayed(config.getDelayForAttempt(attempts));
        }
      }

      throw StateError('Unreachable');
    };
  }
}

/// Example Usage:
/// 
/// A provider using the retry logic to fetch data with automatic retries on failure.
/// ```dart
/// final anotherProvider = FutureProvider.autoDispose<String>((ref) async {
///   final retryFunction = ref.withRetryFunction(
///     maxRetries: 5, // Retry up to 5 times
///     delay: Duration(milliseconds: 100), // Initial delay of 100 ms
///     backoffFactor: 1.5, // Increase delay by 1.5 times after each retry
///   );
///
///   return retryFunction(() async {
///     return await someApiCall(); // Call to some API
///   });
/// });
/// ```
