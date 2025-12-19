/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC:  %compiler %cmp_opt %f -o %output %cmp_utest_opt
// EXEC: %run %run_opt %output %run_utest_opt %run_args 

@Test
class ThreadSnapshotInfoTest {
    /*
     * Test description: public class ThreadSnapshot
     * Test API:
     * public static func dumpCurrentThread(): ThreadSnapshot
     *
     */
    @TestCase
    func testdumpCurrentThread(): Unit {
        let thread = Thread.currentThread
        let newName = "main thread"
        thread.name = newName
        let threadInfo: ThreadSnapshot = ThreadSnapshot.dumpCurrentThread()
        @Expect(threadInfo.id,thread.id)
        @Expect(threadInfo.name,newName)
        @Expect(threadInfo.state.toString() == ThreadState.Running.toString())
        @Expect(threadInfo.stackTrace.size > 0)
    }

    /*
     * Test description: public class ThreadSnapshot
     * Test API:
     * public static func dumpAllThreads(): Array<ThreadSnapshot>
     *
     */
    @TestCase
    func testdumpAllThreads(): Unit {
        let thread = Thread.currentThread
        let newName = "main thread"
        thread.name = newName
        let future = spawn {
            while (true) {
                sleep(Duration.millisecond * 100)
                if (Thread.currentThread.hasPendingCancellation) {
                    println("I'm cancelled")
                    return
                }
            }
        }
        future.thread.name = "test"
        sleep(Duration.millisecond * 100)
        let threadInfoArray: Array<ThreadSnapshot> = ThreadSnapshot.dumpAllThreads()
        let size = threadInfoArray.size
        @Expect(size, 2)
        for (i in 0..size) {
            let threadInfoData = threadInfoArray[i]
            if (threadInfoData.id != Thread.currentThread.id) {
                @Expect(threadInfoData.id, future.thread.id)
                @Expect(threadInfoData.name, "test")
                @Expect(threadInfoData.state.toString() != ThreadState.Terminated.toString())
                @Expect(threadInfoData.stackTrace.size > 0)
            }
        }
        future.cancel()
        sleep(Duration.millisecond * 300)
        let threadInfoArray2: Array<ThreadSnapshot> = ThreadSnapshot.dumpAllThreads()
        @Expect(threadInfoArray2.size, 1)
        @Expect(threadInfoArray2[0].id, Thread.currentThread.id)
        @Expect(threadInfoArray2[0].name, newName)
        @Expect(threadInfoArray2[0].state.toString() == ThreadState.Running.toString())
        @Expect(threadInfoArray2[0].stackTrace.size > 0)
    }
}
