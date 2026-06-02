/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not O2) EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// (not O2) RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.sync.*
import std.runtime.*
import std.collection.*

func TriggerGC(): Unit {
    spawn {
        while (true) {
            GC()
        }
    }
}

class A {
    var a = Array<Int64>(256) {i => 64}
}

let atomicA: AtomicReference<A> = AtomicReference<A>(A())

class B {
    public func changeI128(): Int64 {
        var sumCnt = 10
        var sum: Array<Int64> = Array<Int64>(sumCnt) {i => Int64(0)}
        var a: Array<Int64> = Array<Int64>(512) {i => Int64(2 * i)}
        var b: Array<Int64> = Array<Int64>(512) {i => Int64(3 * i)}
        for (j in 0..300) {
            var innerLoop = sum.size
            for (i in 0..100) {
                atomicA.swap(A())
            }
            while (innerLoop > 0) {
                GC()
                innerLoop--
                for (i in 0..a.size) {
                    a[i] &= b[i]
                }
                for (i in 0..a.size) {
                    sum[Int64(innerLoop)] += a[i] / 5 + Int64(innerLoop)
                }
            }
        }
        var ret = 0
        for (i in 0..sum.size) {
            ret += sum[i]
        }
        return ret
    }
}

main() {
    TriggerGC()
    let futs = ArrayList<Future<Int64>>()
    for (i in 0..10) {
        futs.add(spawn {
            B().changeI128()
        })
    }
    var sum: Int64 = 0
    for (i in 0..10) {
        sum += futs[i].get()
    }
    println("${sum}")
}
