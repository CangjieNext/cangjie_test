/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test.memory

import std.collection.*
import std.sync.*
import std.random.*

/*
    <string name="monitor_stresscase1">多线程竞长时间争同一把锁sleep</string>
    <string name="monitor_stresscase2">多线程长时间竞争同一把锁wait</string>
    <string name="monitor_stresscase3">反复调用charset</string>
    <string name="monitor_stresscase4">clone锁变量测试</string>
    <string name="monitor_stresscase5">thread created and interrupted</string>
    <string name="monitor_stresscase35">Volatile clone</string>
    <string name="monitor_stresscase36">LinkedBlockingQueue</string>

        new TestCaseData(R.string.monitor_stresscase1, true, "testCase30"),
        new TestCaseData(R.string.monitor_stresscase2, true, "testCase31"),
        new TestCaseData(R.string.monitor_stresscase3, true, "testCase32"),
        new TestCaseData(R.string.monitor_stresscase4, true, "testCase33"),
        new TestCaseData(R.string.monitor_stresscase5, true, "testCase34"),
        new TestCaseData(R.string.monitor_stresscase35, true, "testCase35"),
        new TestCaseData(R.string.monitor_stresscase36, true, "testCase36"),
*/

let INIT_DEFAULT_STRESS_THREAD_NUM_thread = 60
let DEFAULT_STRESS_THREAD_NUM_thread = INIT_DEFAULT_STRESS_THREAD_NUM_thread
let THREAD_TEST_NAME = "thread_testcase"
var mThreadList_thread = ArrayList<Thread>()


class MonitorTest <: Runnable {
    var lockObject : ReentrantMutex
    var sleepTime : Int64
    var repeat : Int64
    init(lockObject:ReentrantMutex, sleepTime:Int64, repeatTimes!:Int64=DEFAULT_STRESS_THREAD_NUM){
        this.lockObject = lockObject
        this.sleepTime = sleepTime
        this.repeat = repeatTimes
    }
    public func run(){
        while (THREAD_REPEATS_INFINITE == repeat || repeat > 0) {
            if (repeat > 0){
                repeat--
            }
            var break_me = false
            synchronized(lockObject) {

                tryRest()
                trySleep(sleepTime)

                if(!mRunning){
                    // TODO: use break here will cause a bug.
                    break_me = true
                }

            }
            if (break_me){
                break
            }
        }

    }
}

// not run this one.
public func thread_testcase1(){
    print("[INFO]start ${THREAD_TEST_NAME}_1!\n")
    var lockObject = ReentrantMutex()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_HALF){
        var tmp = MonitorTest(lockObject, THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = StopAbleThread(tmp, GC_TEST_NAME + "_testcase1_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    print("[INFO]end ${THREAD_TEST_NAME}_1!\n")
}

public func thread_testcase30(){
    print("[INFO]start ${THREAD_TEST_NAME}_30!\n")
    var lockObject = ReentrantMutex()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_HALF){
        var tmp = MonitorTest(lockObject, THREAD_SLEEP_TIME_DEFAULT)
        var t = StopAbleThread(tmp, GC_TEST_NAME + "_testcase30_${i}")
        list.add(t)
    }
    // mThreadList.add(all: list) , this mThreadList is too big.
    print("${mThreadList.size}\n")
    var futures = startAllThread(list)
    // waitAllThreadFinish(futures) // do not wait finish.
    print("[INFO]end ${THREAD_TEST_NAME}_30!\n")
}

// testCase31 need InterruptedException
// testCase32 need Charset, test String
// testCase33 need Cloneable
// testCase34 need interrupted
// testCase35 need Volatile clone
// testCase36 need LinkedBlockingQueue