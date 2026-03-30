/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_utest_opt 

@Test
class FutureClearHandleTest {
    @TestCase
    func testFutureBasic(): Unit {
        let future = spawn {
            return 42
        }
        let result = future.get()
        @Expect(result, 42)
    }

    @TestCase
    func testFutureWithDelay(): Unit {
        let future = spawn {
            sleep(Duration.millisecond * 50)
            return 100
        }
        let result = future.get()
        @Expect(result, 100)
    }

    @TestCase
    func testFutureWithException(): Unit {
        let future = spawn {
            throw Exception("Test exception")
        }
        var exceptionThrown = false
        try {
            future.get()
        } catch (e: Exception) {
            exceptionThrown = true
        }
        @Expect(exceptionThrown, true)
    }

    @TestCase
    func testFutureCancel(): Unit {
        let future = spawn {
            sleep(Duration.second * 10)
            return 0
        }
        future.cancel()
        sleep(Duration.millisecond * 100)
        @Expect(future.thread.state.toString(), ThreadState.Terminated.toString())
    }

    @TestCase
    func testFutureMultipleFutures(): Unit {
        let futures = Array<Future<Int64>>(5, { _ => spawn { return 0 } })
        
        for (i in 0..5) {
            futures[i] = spawn {
                sleep(Duration.millisecond * 10)
                return i
            }
        }
        
        for (i in 0..5) {
            let result = futures[i].get()
            @Expect(result, i)
        }
    }

    @TestCase
    func testFutureWithReturnEarly(): Unit {
        let future = spawn {
            if (true) {
                return 1
            }
            return 2
        }
        let result = future.get()
        @Expect(result, 1)
    }

    @TestCase
    func testFutureNestedSpawn(): Unit {
        let future = spawn {
            let inner = spawn {
                return 10
            }
            return inner.get() + 5
        }
        let result = future.get()
        @Expect(result, 15)
    }

    @TestCase
    func testFutureConcurrentAccess(): Unit {
        let future = spawn {
            sleep(Duration.millisecond * 100)
            return 42
        }
        
        let threads = Array<Future<Unit>>(5, { _ => spawn { return } })
        
        for (i in 0..5) {
            threads[i] = spawn {
                let _ = future.thread.state
                return
            }
        }
        
        for (i in 0..5) {
            threads[i].get()
        }
        
        let result = future.get()
        @Expect(result, 42)
    }
}
