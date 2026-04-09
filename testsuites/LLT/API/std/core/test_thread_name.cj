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
class ThreadNameTest {
    @TestCase
    func testThreadNameBasic(): Unit {
        let thread = Thread.currentThread
        let originalName = thread.name
        
        thread.name = "TestThread1"
        @Expect(thread.name, "TestThread1")
        
        thread.name = "TestThread2"
        @Expect(thread.name, "TestThread2")
        
        thread.name = originalName
    }

    @TestCase
    func testThreadNameInSpawn(): Unit {
        let future = spawn {
            Thread.currentThread.name = "SpawnedThread"
            sleep(Duration.millisecond * 50)
            return Thread.currentThread.name
        }
        
        sleep(Duration.millisecond * 10)
        @Expect(future.thread.name, "SpawnedThread")
        
        let name = future.get()
        @Expect(name, "SpawnedThread")
    }

    @TestCase
    func testConcurrentSetNameNoCrash(): Unit {
        let future = spawn {
            var count = 0
            while (count < 10 && !Thread.currentThread.hasPendingCancellation) {
                sleep(Duration.millisecond * 20)
                count++
            }
        }
        
        let threadCount = 10
        let threads = Array<Future<Unit>>(threadCount, { _ => spawn { return } })
        
        for (i in 0..threadCount) {
            threads[i] = spawn {
                future.thread.name = "ThreadName${i}"
                return
            }
        }
        
        for (i in 0..threadCount) {
            threads[i].get()
        }
        
        future.cancel()
        sleep(Duration.millisecond * 100)
        @Expect(future.thread.state.toString() == ThreadState.Terminated.toString())
    }

    @TestCase
    func testSetNameWithLongString(): Unit {
        let thread = Thread.currentThread
        let originalName = thread.name
        
        let longName = "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
        thread.name = longName
        @Expect(thread.name, longName)
        
        thread.name = originalName
    }

    @TestCase
    func testSetNameEmpty(): Unit {
        let thread = Thread.currentThread
        let originalName = thread.name
        
        thread.name = ""
        @Expect(thread.name, "")
        
        thread.name = originalName
    }

    @TestCase
    func testMultipleSetNamesSequentially(): Unit {
        let thread = Thread.currentThread
        let originalName = thread.name
        
        for (i in 0..50) {
            thread.name = "Name${i}"
            @Expect(thread.name, "Name${i}")
        }
        
        thread.name = originalName
    }
}
