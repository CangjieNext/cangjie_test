/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test.memory

import std.random.*
import std.runtime.*
import std.collection.*
import std.sync.*

var DEFAULT_THREAD_NUM_GC = 10
var GC_THREAD_NOTIFY = DEFAULT_THREAD_NUM_GC
var GC_TEST_NAME = "gc testcase"
var THREAD_SLEEP_TIME_DEFAULT = 1
var THREAD_REPEATS_INFINITE = -1
var THREAD_REPEATS_DEFAULT = 1
var STATIC_REFERENCE_MAX = 100000
var STATIC_SIZE_MAX = 15*1024*1024
var STACK_SIZE_MAX = STATIC_SIZE_MAX
var FINALIZE_SIZE_MAX = STATIC_SIZE_MAX
var STRING_REFERENCE_MAX = 500000
var STACK_REFERENCE_MAX = 100000
var mstaticreference = ArrayList<?AllocUnit>()
var mstaticstring = ArrayList<String>()
var gc_thread_count = 0

class CommonRun <: Runnable {
    var sleepTime: Int64
    var repeats: Int64
    var r : Runnable
    init(
        r: Runnable,
        sleepTime: Int64,
        repeatTimes!: Int64 = THREAD_REPEATS_INFINITE
    ){
        this.sleepTime = sleepTime
        repeats = repeatTimes
        this.r = r
    }

    public func run(){
        while (THREAD_REPEATS_INFINITE == repeats || repeats > 0) {
            if (repeats > 0) {
                repeats--
            }
            r.run()
            trySleep(sleepTime)
            if (!mRunning) {
                break
            }
        }
    }
}

class AllocUnitCycleMaster <: AllocUnit{
    var slave : ?AllocUnitCycleSlave = None // TODO: not equal to java.
    init(arrayLength:Int64){
        super(arrayLength)
        slave = AllocUnitCycleSlave(arrayLength, this)
    }
}

class AllocUnitCycleSlave <: AllocUnit{
    var master : AllocUnitCycleMaster
    init(arrayLength:Int64, master:AllocUnitCycleMaster){
        super(arrayLength)
        this.master = master
    }
}

func static_test(){
    static_test_alloc();
    static_test_free();
}

func static_test_alloc(){
    var allocsize = 0
    var rand = Random()
    var randNumber = rand.nextInt64(128) + 8
    for (i in 0..STATIC_REFERENCE_MAX){
        for (j in 0..10){
            randNumber = 128/2 + 8
            var one = AllocUnitCycleMaster(randNumber)
            addtomstaticreference(one)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STATIC_SIZE_MAX) {return}
        for (j in 0..10){
            randNumber = 1888/2 + 144
            var one = AllocUnitCycleMaster(randNumber)
            addtomstaticreference(one)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STATIC_SIZE_MAX) {return}
        randNumber = 12288/2 + 2048
        allocsize = allocsize + 2 * randNumber
        if (allocsize > STATIC_SIZE_MAX) {return}
        var one = AllocUnitCycleMaster(randNumber)
        addtomstaticreference(one)
    }
}

func static_test_preempt(){
    static_test_alloc_preempt()
    thread_test_gc()
}

func static_test_alloc_preempt(){
    var allocsize = 0
    var rand = Random()
    var randNumber = rand.nextInt64(128) + 8
    for(i in 0..STATIC_REFERENCE_MAX){
        for (j in 0..10){
            randNumber = 128/2+8
            var one = AllocUnitCycleMaster(randNumber)
            settomstaticreference(i, one)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STATIC_SIZE_MAX) {return}
        for (j in 0..10){
            randNumber = 1888/2 + 144
            var one = AllocUnitCycleMaster(randNumber)
            settomstaticreference(i, one)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STATIC_SIZE_MAX) {return}
        randNumber = 12288/2 + 2048
        allocsize = allocsize + 2 * randNumber
        if (allocsize > STATIC_SIZE_MAX) {return}
        var one = AllocUnitCycleMaster(randNumber)
        settomstaticreference(i, one)
    }
}

var mstaticreference_m = ReentrantMutex()
func addtomstaticreference(one:AllocUnit){
   synchronized (mstaticreference_m) {
        mstaticreference.add(one)
   }
}


func settomstaticreference(i:Int64, one:AllocUnit){
   synchronized (mstaticreference_m) {
        mstaticreference[i] = one
   }
}

func static_test_free(){
   synchronized (mstaticreference_m) {
        mstaticreference.clear()
        thread_test_gc()
   }
}

func reset_mstaticreference(){
    var s = 0
    synchronized(mstaticreference_m)
    {
        s = mstaticreference.size;
    }
    for (i in s..STATIC_REFERENCE_MAX){
        synchronized(mstaticreference_m)
        {
            mstaticreference.add(None<AllocUnit>);
        }
    }
    synchronized(mstaticreference_m)
    {
        for (i in 0..mstaticreference.size){
            match (mstaticreference.get(i)) {
                case Some(V) => mstaticreference[i] =None<AllocUnit>;()
                case None => ()
            }
        }
    }
}


var thread_test_gc_m = ReentrantMutex()
func thread_test_gc(){
    synchronized(thread_test_gc_m) {
        if (gc_thread_count >= GC_THREAD_NOTIFY){
            gc_thread_count = 0
            unsafe{
                GC()
            }
        } else{
            gc_thread_count++
        }
    }
}


class Gc_TestCase_1 <: Runnable{
    public func run(){
        static_test()
    }
}


public func gc_testcase1(){
    print("[INFO]start ${GC_TEST_NAME}_1!\n")
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_1(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase1_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    // manually gc here.
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_1!\n")
}

public func gc_test1(){
    print("[INFO]start ${GC_TEST_NAME}_1!\n")
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_1(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase1_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    // manually gc here.
    GC()
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_1!\n")
}


class Gc_TestCase_2 <: Runnable{
    public func run(){
        static_test_preempt()
    }
}

public func gc_test2(){
    print("[INFO]start ${GC_TEST_NAME}_2!\n")
    reset_mstaticreference()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_2(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase2_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    mstaticreference.clear()
    GC()
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_2!\n")
}

var addtoStaticString_m = ReentrantMutex()
func addtoStaticString(a:String){
    synchronized (addtoStaticString_m){
        mstaticstring.add(a)
        //print("${mstaticstring.size}\n")
    }
}

var METASTRING = "gctest,gctest/gctest-) gctest"

func string_test_alloc_global(){
    for (i in 0..STRING_REFERENCE_MAX){
        var a = METASTRING + i.toString()
        addtoStaticString(a)
    }
}

func string_test_free(){
    mstaticstring.clear()
    thread_test_gc()
}

class Gc_TestCase_3 <: Runnable{
    public func run(){
        string_test_alloc_global()
        string_test_free()
    }
}

public func gc_test3(){
    print("[INFO]start ${GC_TEST_NAME}_3!\n")
    reset_mstaticreference()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_3(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase3_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    GC()
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_3!\n")
}

func string_test_alloc_local(){
    var mString = ArrayList<String>()
    for (i in 0..STRING_REFERENCE_MAX) {
        var a = METASTRING + i.toString()
        mString.add(a)
    }
}

class Gc_TestCase_4 <: Runnable{
    public func run(){
        string_test_alloc_local()
    }
}

public func gc_test4(){
    print("[INFO]start ${GC_TEST_NAME}_3!\n")
    reset_mstaticreference()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_4(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase4_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    GC()
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_4!\n")
}

func stack_test(){
    var mlocalrefarray = ArrayList<AllocUnit>(STACK_REFERENCE_MAX)
    var allocsize = 0
    var rand = Random()
    for (i in 0..STACK_REFERENCE_MAX){
        for (j in 0..10){
            var randNumber = rand.nextInt64(128) + 8
            mlocalrefarray[i] = AllocUnitCycleMaster(randNumber)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STACK_SIZE_MAX) { return }
        for (j in 0..10){
            var randNumber = rand.nextInt64(1888) + 144
            mlocalrefarray[i] = AllocUnitCycleMaster(randNumber)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STACK_SIZE_MAX) { return }
        var randNumber = rand.nextInt64(12288) + 2048
        allocsize = allocsize + 2 * randNumber
        mlocalrefarray[i] = AllocUnitCycleMaster(randNumber)
    }
    mlocalrefarray.clear()
    for (i in 0..STACK_REFERENCE_MAX){
        for (j in 0..10){
            var randNumber = rand.nextInt64(128) + 8
            mlocalrefarray[i] = AllocUnitCycleMaster(randNumber)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STACK_SIZE_MAX) { return }
        for (j in 0..10){
            var randNumber = rand.nextInt64(1888) + 144
            mlocalrefarray[i] = AllocUnitCycleMaster(randNumber)
            allocsize = allocsize + 2 * randNumber
        }
        if (allocsize > STACK_SIZE_MAX) { return }
        var randNumber = rand.nextInt64(12288) + 2048
        allocsize = allocsize + 2 * randNumber
        mlocalrefarray[i] = AllocUnitCycleMaster(randNumber)
    }
    GC()
}

class Gc_TestCase_5 <: Runnable{
    public func run(){
        stack_test()
    }
}

public func gc_test5(){
    print("[INFO]start ${GC_TEST_NAME}_5!\n")
    reset_mstaticreference()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_5(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase5_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    GC()
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_5!\n")
}



class AllocUnitCycleMasterF <: AllocUnit{
    var slave : ?AllocUnitCycleSlaveF = None // TODO: not equal to java.
    init(arrayLength:Int64){
        super(arrayLength)
        slave = AllocUnitCycleSlaveF(arrayLength, this)
    }
}

class AllocUnitCycleSlaveF <: AllocUnit{
    var master : AllocUnitCycleMasterF
    init(arrayLength:Int64, master:AllocUnitCycleMasterF){
        super(arrayLength)
        this.master = master
    }
    ~init(){
        //alloc_array.clear()
        //master.alloc_array.clear()
    }
}


// todo: gc_testcase6 need finalizer.
class Gc_TestCase_6 <: Runnable{
    public func run(){
        finalize_test(ENUM_RANGE.ENUM_RANGE_ALL);
        trySleep(2000);
        thread_test_gc();
    }
}

func finalize_test(r:ENUM_RANGE){
    var allocsize = 0
    var rand = Random()
    var randNumber = rand.nextInt64(128) + 8
    match (r){
        case ENUM_RANGE_ALL =>
            for ( i in 0..STATIC_REFERENCE_MAX) {
                for (j in 0..10) {
                    randNumber =128/2 + 8;
                    var one = AllocUnitCycleMasterF(randNumber);
                    settomstaticreference(i, one);
                    allocsize = allocsize + 2 * randNumber;
                }
                if (allocsize > FINALIZE_SIZE_MAX) {
                    return;
                }
                for (j in 0..10) {
                    randNumber = 1888/2 + 144;
                    var one = AllocUnitCycleMasterF(randNumber);
                    settomstaticreference(i, one);
                    allocsize = allocsize + 2 * randNumber;
                }
                if (allocsize > FINALIZE_SIZE_MAX) {
                    return;
                }
                randNumber = 12288/2 + 2048;
                allocsize = allocsize + 2 * randNumber;
                while (allocsize > FINALIZE_SIZE_MAX) {
                    return;
                }
                var one = AllocUnitCycleMasterF(randNumber);
                settomstaticreference(i, one);
            }
        case _ => return

    }
}



public func gc_test6(){
    print("[INFO]start ${GC_TEST_NAME}_6!\n")
    reset_mstaticreference()
    var list = ArrayList<Thread>()
    for (i in 0..DEFAULT_THREAD_NUM_GC){
        var tmp : Runnable = CommonRun(Gc_TestCase_6(), THREAD_SLEEP_TIME_DEFAULT, repeatTimes:THREAD_REPEATS_DEFAULT)
        var t = Thread(tmp, GC_TEST_NAME + "_testcase5_${i}")
        list.add(t)
    }
    var futures = startAllThread(list)
    waitAllThreadFinish(futures)
    mstaticreference.clear()
    GC()
    GC()
    trySleep(1000)
    print("[INFO]end ${GC_TEST_NAME}_6!\n")
}

public func gc_test7(){
    print("[INFO]start ${GC_TEST_NAME}_7!\n")
    trySleep(5000)
    GC()
    trySleep(1000)
    print("[INFO]start ${GC_TEST_NAME}_7!\n")
}

// test native func.
public func gc_test8(){

}
