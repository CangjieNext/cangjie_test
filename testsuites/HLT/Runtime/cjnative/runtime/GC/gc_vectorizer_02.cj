/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.sync.*
import std.collection.*
import std.runtime.*

class DataPack {
    init(a: Int64) {
        i64 = a
    }
    public var tag: Bool = false
    public var i8: Int8 = 1
    public var i16: Int16 = 1
    public var i32: Int32 = 1
    public var i64: Int64 = 1
    public var f16: Float16 = 0.1
    public var f32: Float32 = 0.22
    public var f64: Float64 = 0.33
}

let atomicDataWrap = AtomicReference<DataPack>(DataPack(1))
let dataPackSet = ArrayList<DataPack>()

func TriggerGC(): Unit {
    spawn {
        while (true) {
            GC()
        }
    }
}

func PrepareData(): Unit {
    for (i in 0..10000) {
        dataPackSet.add(DataPack(i))
    }
}

func TestWriteBarrier(): Unit {
    for (j in 0..10) {
        for (i in 0..10000) {
            var tmp = dataPackSet[i]
            var old = atomicDataWrap.swap(tmp)
            tmp.i16 = 3
            tmp.f16 = 0.33
            tmp.f32 = 0.44
            tmp.f64 = 0.55
            tmp.i32 = 4
            tmp.i64 = 5
            tmp.tag = true
            tmp.i8 = 6
            atomicDataWrap.compareAndSwap(tmp, old)
            GC()
        }
    }
}

main() {
    TriggerGC()
    PrepareData()
    var futs = ArrayList<Future<Unit>>()
    for (i in 0..10) {
        futs.add(spawn {
            TestWriteBarrier()
        })
    }
    for (i in 0..10) {
        futs[i].get()
    }
}
