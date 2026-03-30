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
class AtexitTest {
    @TestCase
    func testAtexitBasicRegistration(): Unit {
        var callbackExecuted = false
        let callback = { =>
            callbackExecuted = true
        }
        @Expect(callbackExecuted, false)
    }

    @TestCase
    func testAtexitMultipleCallbacks(): Unit {
        var counter = 0
        let callback1 = { => counter = counter + 1 }
        let callback2 = { => counter = counter + 10 }
        let callback3 = { => counter = counter + 100 }
        @Expect(counter, 0)
    }

    @TestCase
    func testAtexitCallbackOrder(): Unit {
        var result = ""
        let callback1 = { => result = result + "A" }
        let callback2 = { => result = result + "B" }
        let callback3 = { => result = result + "C" }
        @Expect(result, "")
    }

    @TestCase
    func testAtexitConcurrentRegistration(): Unit {
        var counter = AtomicInt64(0)
        
        let threadCount = 10
        let threads = Array<Future<Unit>>(threadCount, { _ => spawn { return } })
        
        for (i in 0..threadCount) {
            threads[i] = spawn {
                let callback = { =>
                    counter.fetchAdd(1)
                }
                return
            }
        }
        
        for (i in 0..threadCount) {
            threads[i].get()
        }
        
        @Expect(counter.load(), 0)
    }

    @TestCase
    func testAtexitEmptyCallback(): Unit {
        let emptyCallback = { => }
        @Expect(true, true)
    }

    @TestCase
    func testAtexitCallbackWithException(): Unit {
        var executed = false
        let callbackWithException = { =>
            executed = true
            throw Exception("Test exception in callback")
        }
        @Expect(executed, false)
    }
}
