/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package test.memory

import std.sync.*
import std.runtime.*
import std.collection.*
import std.random.*

var ALLOC_UNIT_SIZE = 88;

// TODO: May modify due to runtime implement.
let LOCAL_MIN_IDX = 0
let LOCAL_MAX_IDX = 15
let GLOBAL_MIN_IDX = 16
let GLOBAL_MAX_IDX = 62

let LARGE_PAGE_SIZE = 4096
let PAGE_SIZE = 4016
let PAGE_HEADSIZE = 80

let OBJ_MAX_SIZE = 1008
let OBJ_HEADSIZE = 16

let LARGEOBJ_CHOSEN_NUM = 2
let LARGEOBJ_ALLOC_SIZE = 128 * LARGE_PAGE_SIZE
let MAX_REALIVE_OBJ_NUM = 1000



public open class AllocUnit{
    //var alloc_array : RefArray<Int8>
    var alloc_array : Array<Int8>

    AllocUnit(Length:Int64){
        alloc_array = Array<Int8>(Length,repeat:Int8(1))
    }
    init(){
        this(ALLOC_UNIT_SIZE)
    }
}

class Integer <: Hashable & Equatable<Integer>{
    var v:Int64
    init(x:Int64){v = x}
    public func hashCode(): Int64 {v.hashCode()}
    public operator func == (x: Integer): Bool {this.v == x.v}
    public operator func != (x: Integer): Bool {this.v != x.v}
}


interface Runnable{
    func run():Unit
}

// TODO: not implement in cangjie
open class Thread <: Runnable{
    var name : String
    var m : Runnable
    protected open func start(){
        print("start Thread ${name}!\n")
        return spawn {m.run()}
    }
    public func run(){
        m.run()
    }
    init(target:Runnable, n:String){
        m=target
        name=n
    }
}


var mAllThread = ArrayList<Thread>()
// TODO: rely on java Thread.
class StopAbleThread <: Thread{
    // in java, we use ArraySet.
    private var mMutex = ReentrantMutex()
    init(m: Runnable, name: String){
        super(m, name)
    }


    private func recordThread(t:Thread) {
        synchronized (mMutex) {
            mAllThread.add(t)
        }
    }

    // TODO: isAlive in java. Used in android UI.
    private func removeDeadThread(){}
    // TODO: interrupt in java. Used in start_btn_interrupt_id.
    private func interruptAllThread(){}
    private func checkAllThreadExit(){}
    private func stopAllThread(){}
}

func preGC(){
    FinalizerAllocUnitGlobal()
    GC()
}

func alloc_byte_idx(bytesize_:Int64, idx:Int64, diff:Int64, isStress:Bool, finalizer!:Int64=0){
    var array : ArrayList<AllocUnit> = ArrayList<AllocUnit>()
    if (idx < LOCAL_MIN_IDX || idx > GLOBAL_MAX_IDX){
        throw Exception("idx < LOCAL_MIN_IDX || idx > GLOBAL_MAX_IDX")
    }
    var bytesize = pagesize_to_allocsize(bytesize_)
    var size_ : Int64 = idx_to_size(idx)
    if (size_ <= 0) {
        throw Exception("alloc_byte_idx size_ <= 0")
    }
    var sizenum = bytesize / size_
    if (sizenum == 0) {
        throw Exception("alloc_byte_idx sizenum == 0")
    }
    if (diff >= 0 || (sizenum + diff) > 0) {
        sizenum = sizenum + diff
    }
    for (i in 0..sizenum) {
        if (finalizer == 0){
            array.add(AllocOneUnit(size_, isStress))
        }
        else if (finalizer == 1){
            alloc_in_finalizer = size_
            preGC()
            array.add(FinalizerAllocated)
        } else if (finalizer == 2){
            alloc_in_finalizer = size_
            array.add(FinalizerAllocUnit(size_))
        }
    }
    return array
}



func alloc_byte_large(bytesize:Int64,alloc_size:Int64,diff:Int64,isStress:Bool){
    var array : ArrayList<AllocUnit> = ArrayList<AllocUnit>()
    if (alloc_size <= OBJ_MAX_SIZE) {
        throw Exception("alloc_size <= OBJ_MAX_SIZE")
    }
    var size : Int64 = 0
    if ((bytesize + diff * alloc_size) <= 0) {
        throw Exception("(bytesize + diff * alloc_size) <= 0")
    }
    var bytesize_ = bytesize + diff * alloc_size
    while (size < bytesize_) {
        size += alloc_size
        array.add(AllocOneUnit(alloc_size, isStress))
    }
    return array
}

var totalAllocedNum : Int64 = 0

// TODO: not implement in cangjie.
// TODO: can update AllocUnitCycleMaster here.
func AllocOneUnit(alloc_size:Int64,isStress:Bool){
    totalAllocedNum++
    var curNum : Int64 = totalAllocedNum % 100
    return AllocUnit(alloc_size);
}


func idx_to_size(idx:Int64){
    var ret : Int64 = 0
    if (idx < 0 || idx > GLOBAL_MAX_IDX) {
        print("[ERROR] alloc wrong idx in idx_to_size!\n")
        return 112 // why 112?
    }
    if (idx < GLOBAL_MAX_IDX) {
        ret = (idx+1)*8 + OBJ_HEADSIZE
    } else {
        // idx equals GLOBAL_MAX_IDX
        ret = OBJ_MAX_SIZE + OBJ_HEADSIZE;
    }
    return ret
}

func pagesize_to_allocsize(size:Int64){
    var ret : Int64 = 0
    var pagenum : Int64 = 0
    var size_ = size
    if ( size_ > (PAGE_SIZE + PAGE_HEADSIZE)) {
        pagenum = size_ / (PAGE_SIZE + PAGE_HEADSIZE)
        size_ = size_ - pagenum * (PAGE_SIZE + PAGE_HEADSIZE)
    }
    if (size_ < PAGE_SIZE) {
        ret = pagenum * PAGE_SIZE + size_
    } else {
        ret = pagenum * PAGE_SIZE + PAGE_SIZE;
    }
    return ret
}


func alloc_choose_idx(size:Int64, range:ENUM_RANGE, chosen:Int64, prop_:Int64, random:Bool, isStress: Bool){
    var purpose = ArrayList<Integer>()
    var other = ArrayList<Integer>()
    var large_obj_list = ArrayList<Integer>()
    var array = ArrayList<AllocUnit>()
    var has_small = false
    var has_large = true
    if (!random){
        match (range){
            case ENUM_RANGE_LOCAL =>
                purpose.add(all: choose_idx(LOCAL_MIN_IDX, GLOBAL_MIN_IDX, chosen, random))
                has_small = true
            case ENUM_RANGE_GLOBAL =>
                purpose.add(all: choose_idx(GLOBAL_MIN_IDX, GLOBAL_MAX_IDX + 1, chosen, random))
                has_small = true;
            case ENUM_RANGE_BOTH =>
                var chosen_ = chosen / 2
                purpose.add(all: choose_idx(LOCAL_MIN_IDX, GLOBAL_MIN_IDX, chosen_, random))
                other.add(all: choose_idx(GLOBAL_MIN_IDX, GLOBAL_MAX_IDX + 1, chosen_, random))
                has_small = true
            case ENUM_RANGE_LARGEOBJ =>
                large_obj_list.add(Integer(LARGE_PAGE_SIZE))
                large_obj_list.add(Integer(8 * LARGE_PAGE_SIZE))
                has_large = true
            case ENUM_RANGE_ALL =>
                var chosen_ = chosen / 2
                purpose.add(all: choose_idx(LOCAL_MIN_IDX, GLOBAL_MIN_IDX, chosen_, random))
                other.add(all: choose_idx(GLOBAL_MIN_IDX, GLOBAL_MAX_IDX + 1, chosen_, random))
                large_obj_list.add(Integer(LARGE_PAGE_SIZE))
                large_obj_list.add(Integer(8 * LARGE_PAGE_SIZE))
                has_small = true
                has_large = true
            case _ =>
                throw Exception("wrong range in alloc_choose_idx")
        }
    } else {
        match (range){
            case ENUM_RANGE_LOCAL =>
                purpose.add(all: choose_idx(LOCAL_MIN_IDX, LOCAL_MAX_IDX, chosen, random))
                has_small = true
            case ENUM_RANGE_GLOBAL =>
                purpose.add(all: choose_idx(GLOBAL_MIN_IDX, GLOBAL_MAX_IDX, chosen, random))
                has_small = true;
            case ENUM_RANGE_BOTH =>
                var chosen_ = chosen / 2
                purpose.add(all: choose_idx(LOCAL_MIN_IDX, LOCAL_MAX_IDX, chosen_, random))
                other.add(all: choose_idx(GLOBAL_MIN_IDX, GLOBAL_MAX_IDX, chosen_, random))
                has_small = true
            case ENUM_RANGE_LARGEOBJ =>
                var r = Random()
                for (i in 0..LARGEOBJ_CHOSEN_NUM) {
                    large_obj_list.add(Integer((r.nextInt64(32) + 1) * LARGE_PAGE_SIZE))
                }
                has_large = true
            case ENUM_RANGE_ALL =>
                var chosen_ = chosen / 2
                purpose.add(all: choose_idx(LOCAL_MIN_IDX, LOCAL_MAX_IDX, chosen_, random))
                other.add(all: choose_idx(GLOBAL_MIN_IDX, GLOBAL_MAX_IDX, chosen_, random))
                var r = Random()
                for (i in 0..LARGEOBJ_CHOSEN_NUM) {
                    large_obj_list.add(Integer((r.nextInt64(32) + 1) * LARGE_PAGE_SIZE))
                }
                has_large = true;
            case _ =>
                throw Exception("wrong range in alloc_choose_idx")
        }
        ()
    }
    if (has_small) {
        array.add(all: alloc_choose_prop(purpose, other, prop_, size, 0, isStress))
    }
    if (has_large) {
        array.add(all: alloc_list_large(LARGEOBJ_ALLOC_SIZE, large_obj_list, 50, isStress))
    }
    return array
}

func makesureprop(p:Int64) {
    if (p > 100 || p <= 0) {
        return 100
    }
    return p
}

func alloc_choose_prop(purpose:ArrayList<Integer>,other:ArrayList<Integer>,prop_:Int64,size:Int64,diff:Int64,isStress:Bool){
    var p = makesureprop(prop_)
    var array = ArrayList<AllocUnit>()
    var size_alloc = 0
    var n_p = p / 10
    var n_o = (100 - p) / 100
    var no_alloc = true
    while (size_alloc < size) {
        for (i in 0..n_p) {
            for (a in purpose){
                size_alloc += idx_to_size(a.v)
                var temp_array = alloc_byte_idx(idx_to_size(a.v), a.v, diff, isStress)
                array.add(all: temp_array)
                no_alloc = false
            }
            if (size_alloc > size) {
                return array
            }
        }
        for (i in 0..n_o) {
            for (a in other){
                size_alloc += idx_to_size(a.v)
                var temp_array = alloc_byte_idx(idx_to_size(a.v), a.v, diff, isStress)
                array.add(all: temp_array)
                no_alloc = false
            }
            if (size_alloc > size) {
                return array
            }
        }
        if (no_alloc) {
            return array
        }
    }
    return array
}

func alloc_list_large(bytesize: Int64, alloc_list:ArrayList<Integer>,prop_:Int64,isStress:Bool){
    var array = ArrayList<AllocUnit>()
    var size_allocated = Integer(0)
    var p = makesureprop(prop_)
    var n_p = p / 10
    var n_o = (100 - p) / 100
    while (size_allocated.v < bytesize) {
        var first = true
        var loopn = n_p
        if (alloc_list.size == 0){
            return array
        }
        for (a in alloc_list){
            if (first) {
                loopn = n_p
                first = false
            } else{
                loopn = n_o
                first = true
            }
            for (i in 0..loopn){
                size_allocated.v += a.v
                var temp_array = alloc_byte_large(a.v,a.v,0,isStress)
                array.add(all: temp_array)
                if (size_allocated.v > bytesize){
                    return array
                }
            }
        }
    }
    return array
}


func choose_idx(min_:Int64,max_:Int64,chosen:Int64,random:Bool){
    if (min_ > max_){
        throw Exception("alloc wrong min&max in choose_idx")
    }
    var ret : ArrayList<Integer> = ArrayList<Integer>()
    if (!random){
        var grow = (max_ - min_ + chosen) / chosen
        for (i in min_..max_:grow){
            ret.add(Integer(i))
        }
    }else{
        var r1 = Random()
        for (i in 0..chosen) {
            ret.add(Integer(r1.nextInt64(max_ - min_)+min_))
        }
    }
    return ret
}

func startAllThread(l:ArrayList<Thread>){
    var array = ArrayList<Future<Unit>>()
    for (i in l){
        var tmp = i.start()
        array.add(tmp)
        trySleep(5)
    }
    return array
}

func trySleep(t:Int64){
    sleep(Duration.nanosecond * t)
}

func waitAllThreadFinish(a:ArrayList<Future<Unit>>){
    for (f in a){
        try{
            f.get();
            ()
        } catch (_) {
            print("Exception in waitAllThreadFinish!")
        }
    }
}
