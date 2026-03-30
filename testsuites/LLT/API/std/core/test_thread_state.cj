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
class ThreadStateTest {
    @TestCase
    func testThreadStateBasic(): Unit {
        let thread = Thread {
            Thread.sleep(Duration.millisecond * 100)
        }
        thread.start()
        
        let state = thread.state
        @Expect(state == ThreadState.Runnable || state == ThreadState.Blocked, true)
        
        thread.join()
        
        let finalState = thread.state
        @Expect(finalState, ThreadState.Terminated)
    }

    @TestCase
    func testMainThreadState(): Unit {
        let state = Thread.current.state
        @Expect(state == ThreadState.Runnable || state == ThreadState.Blocked, true)
    }

    @TestCase
    func testConcurrentStateAccess(): Unit {
        let thread = Thread {
            Thread.sleep(Duration.millisecond * 200)
        }
        thread.start()
        
        let accessCount = 10
        let threads = Array<Future<Unit>>(accessCount, { _ => spawn { return } })
        
        for (i in 0..accessCount) {
            threads[i] = spawn {
                let _ = thread.state
                return
            }
        }
        
        for (i in 0..accessCount) {
            threads[i].get()
        }
        
        thread.join()
        @Expect(thread.state, ThreadState.Terminated)
    }

    @TestCase
    func testStateAfterTermination(): Unit {
        let thread = Thread {
            return
        }
        thread.start()
        thread.join()
        
        let state1 = thread.state
        let state2 = thread.state
        let state3 = thread.state
        
        @Expect(state1, ThreadState.Terminated)
        @Expect(state2, ThreadState.Terminated)
        @Expect(state3, ThreadState.Terminated)
    }

    @TestCase
    func testUnstartedThreadState(): Unit {
        let thread = Thread {
            return
        }
        
        let state = thread.state
        @Expect(state == ThreadState.New || state == ThreadState.Terminated, true)
    }
}
