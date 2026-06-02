/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan success

import std.collection.*
import std.sync.*
import std.runtime.*
import std.time.*

class AA {
    var aa: Int64

    init() {
        aa = 200
    }
}

class A {
    var a: Float16
    var b: Float32
    var c: Float64
    var d: AtomicOptionReference<AA>
    var float16List: ArrayList<Float16>
    var float32List: ArrayList<Float32>
    var float64List: ArrayList<Float64>
    var int16List: Array<Int16>
    var int32List: Array<Int32>

    init() {
        a = 3.1f16
        b = 3.14f32
        c = .123e2f64
        d = AtomicOptionReference<AA>(Some(AA()))
        float16List = ArrayList<Float16>(100)
        float32List = ArrayList<Float32>(100)
        float64List = ArrayList<Float64>(100)
        int16List = Array<Int16>(100, repeat: 2)
        int32List = Array<Int32>(100, repeat: 50)
        for (i in 0..10) {
            float16List.add(2.8f16)
            float32List.add(5.63f32)
            float64List.add(2.4e-3f64)
        }
    }
}

var count = 0
let mtx = Monitor()

main() {
    let AList: ArrayList<A> = ArrayList<A>()

    let f1 = spawn {
        synchronized(mtx) {
            while (count < 10000) {
                let atomicOptRef = AtomicOptionReference<AA>(Some(AA()))
                var num: Int64
                num = match (atomicOptRef.load()) {
                    case Some(ref) => ref.aa
                    case None => 200
                }
                while (AList.size >= num) {
                    mtx.wait()
                }
                AList.add(A())
                mtx.notifyAll()
            }
        }
    }

    let f2 = spawn {
        synchronized(mtx) {
            while (count < 10000) {
                while (AList.size == 0) {
                    mtx.wait()
                }
                var num: Int64
                num = match (AList[0].d.load()) {
                    case Some(ref) => ref.aa
                    case None => 200
                }
                while (AList.size >= num) {
                    AList.remove(0..num : 1)
                    count++
                    mtx.notifyAll()
                }
            }
        }
    }

    let f3 = spawn {
        while (count < 10000) {
            GC()
            sleep(Duration.millisecond * 30)
        }
    }

    f1.get()
    f2.get()
    f3.get()
    print("success");
}
