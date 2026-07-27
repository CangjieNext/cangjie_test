### Echo

Benchmark measures overheads of library implementation of non-blocking sockets as well as scheduling overheads of runtime.

To observe the scheduler's overhead the number of threads could be varied, e.g.:

1) With one carrier thread we could observe the difference in performance solely of library implementation and polling mechanism.
2) By increasing the number of carriers, we could observe how scheduler's synchronization overhead affects performance.

To facillitate the setup of the benchmarking environment, it is suggested to specify the number of connections
to be not significantly large.
