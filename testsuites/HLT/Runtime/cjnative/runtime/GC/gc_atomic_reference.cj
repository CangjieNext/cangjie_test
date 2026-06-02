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
// ASSERT:scan success

import std.sync.*
import std.collection.*

class A {
    init(i: Int64) {
        a = i
    }
    public func GetValue(): Int64 {
        return a;
    }
    private var a: Int64 = 0
}

main() {
    var atomicFuture = spawn {
        var i: Int64 = 0
        var atomicRef: AtomicReference<A> = AtomicReference<A>(A(i));
        while (i <= 3000) {
            i++
            var ref = atomicRef.load()
            var b: A = A(i)
            if (!atomicRef.compareAndSwap(ref, b)) {
                println("fail at compare and swap expect true")
                return -1
            }
            if (atomicRef.compareAndSwap(ref, b)) {
                println("fail at compare and swap expect false")
                return -1
            }
            var c = atomicRef.swap(A(i))
            if (c.GetValue() != i) {
                println("fail at swap expect ${i}")
                return -1
            }
            atomicRef.store(A(i))
        }
        return 0
    }
    var gcTriggerFuture = spawn {
        var i: Int64 = 0
        while (i <= 1000) {
            var tmp: Array<Int8> = Array<Int8>(4088, repeat: 0)
            i++
        }
    }
    gcTriggerFuture.get()
    atomicFuture.get()
    println("success")
    return 0
}
