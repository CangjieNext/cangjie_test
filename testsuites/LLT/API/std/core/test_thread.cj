/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 
import std.sync.AtomicBool

@Test
class ThreadTest {
    var isFinished = AtomicBool(false)

    /*
     * description: assert of  abnormal test case error
     * params:
     * caseName: case name
     * actualException  case actual exception
     * expectMessage expect exception message
     */
    func anomalyAssert(caseName: String, actualException: Option<Exception>, expectMessage: String) {
        if (let Some(e) <- actualException) {
            if (e.message == expectMessage) {
                @Expect(true)
            } else {
                @Expect("The case ${caseName} error is ${e.message}","The case ${caseName} error is ${expectMessage}")
            }
        } else {
            @Expect("The test case ${caseName} has no errors","The test case ${caseName} has  errors")
        }
    }

    /*
     * Test description: public class Thread
     * Test API:
     * public static prop currentThread: Thread
     *
     */
    @TestCase
    func testCurrentThread(): Unit {
        let thread = Thread.currentThread
        let newName = "main thread"
        thread.name = newName
        @Expect(Thread.currentThread.name,newName)
        @Expect(!thread.hasPendingCancellation)

        let t1 = Thread.currentThread
        t1.name = "main"
        let fut = spawn {
            // Spin
            while (!Thread.currentThread.hasPendingCancellation) {}
            @Expect(Thread.currentThread.name,"child")
            return
        }

        let t2 = fut.thread
        t2.name = "child"
        @Expect(t1.id!=t2.id)
        @Expect(!t2.hasPendingCancellation)
        fut.cancel()
        @Expect(t2.hasPendingCancellation)
        fut.get()

        let mainThread = Thread.currentThread
        let fut2 = spawn {
            return Thread.currentThread.id != mainThread.id
        }
        let result: Bool = fut2.get()
        if (result) {
            @Expect(true)
        } else {
            @Expect(false)
        }
    }

    /*
     * Test description: public class Thread
     * Test API:
     * public prop state: ThreadState
     *
     */
    @TestCase
    func testThreadState(): Unit {
        @Expect(Thread.currentThread.state == ThreadState.Running)
        let future = spawn {
            while (true) {
                sleep(Duration.millisecond * 100)
                if (Thread.currentThread.hasPendingCancellation) {
                    return
                }
            }
        }
        sleep(Duration.millisecond * 10)
        @Expect(future.thread.state == ThreadState.Pending)
        future.cancel()
        sleep(1 * Duration.second)
        @Expect(future.thread.state == ThreadState.Terminated)
    }

    /*
     * Test description: public class Thread
     * Test API:
     * public static prop currentThread: Thread
     *
     */
    @TestCase
    func testHandleUncaughtExceptionBy(): Unit {
        Thread.currentThread.name = "main thread"

        Thread.handleUncaughtExceptionBy {
            thread: Thread, exception: Exception =>
            @Expect(thread.name,"main thread")
            @Expect(exception.message,"a base exception")
        }
        var caseException01: ?Exception = None
        try {
            throw Exception("a base exception")
        } catch (e: Exception) {
            caseException01 = e
        }
        anomalyAssert("testHandleUncaughtExceptionBy_01", caseException01, "a base exception")

        let thread = Thread.currentThread
        thread.name = "main thread"

        Thread.handleUncaughtExceptionBy {
            thread: Thread, exception: Exception =>
            println("old exception handler")
            println("thread name: ${thread.name}")
            println(exception.message)
        }

        Thread.handleUncaughtExceptionBy {
            thread: Thread, exception: Exception =>
            println("thread name: ${thread.name}")
            println("new exception handler")
            println(exception)
        }
        try {
            throw Exception("a base exception")
        } catch (e: Exception) {
            @Expect(e.message,"a base exception")
        }
    }

    /*
     * Test description: public class Thread
     * Test API:
     * public static prop currentThread: Thread
     *
     */
    @TestCase
    func testHandleUncaughtExceptionByForSpawn(): Unit {
        Thread.handleUncaughtExceptionBy {
            thread: Thread, exception: Exception =>
            @Expect(exception.message,"a normal exception in child thread")
            println("thread name: ${thread.name}")
            isFinished.store(true)
        }
        spawn {
            try {
                throw Exception("a normal exception in child thread")
            } catch (e: IndexOutOfBoundsException) {
                println("catch IndexOutOfBoundsException")
            }
        }
        while (!isFinished.load()) {}

        let fut2 = spawn {
            while (!Thread.currentThread.hasPendingCancellation) {}
            throw IllegalArgumentException("a normal exception in child thread")
        }
        let t2 = fut2.thread
        t2.name = "child thread"
        fut2.cancel()
        try {
            fut2.get()
        } catch (e: IllegalArgumentException) {
            @Expect(e.message,"a normal exception in child thread")
        }

        Thread.currentThread.name = "main thread"
        let fut3 = spawn {
            Thread.currentThread.name = "child thread"

            // Register the exception handler in child thread
            Thread.handleUncaughtExceptionBy {
                thread: Thread, exception: Exception =>
                println("thread name: ${thread.name}")
                println(exception)
            }

            throw Exception("a base exception in child thread")
        }
        try {
            fut3.get()
        } catch (e: Exception) {
            @Expect(e.message,"a base exception in child thread")
        }
    }

    /*
     * Test description: public class Thread
     * Test API:
     * public static prop currentThread: Thread
     *
     */
    @TestCase
    func testInvalidHandleUncaughtExceptionByForSpawn(): Unit {
        Thread.handleUncaughtExceptionBy {
            thread: Thread, exception: Exception => throw Exception("a base exception in child thread")
        }
        spawn {
            try {
                throw Exception("a normal exception in child thread")
            } catch (e: Exception) {
                @Expect(e.message,"a base exception in child thread")
            }
        }
        while (!isFinished.load()) {}
        @Expect(true)
    }
}
