/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// (LLVM) EXEC: %compiler %cmp_opt %f -o %output
// (LLVM) RUN-EXEC-1: %run %run_opt %output %run_args | compare %f
// ASSERT: scan None
import std.ref.*
import std.time.*
import std.runtime.*
import std.collection.*

class A {
    var x1: Bool = true
    init(inputA: Bool) {
        x1 = inputA
    }
}

class B {
    var x1: Bool = false
    init(inputB: Bool) {
        x1 = inputB
    }
}

func foo(): WeakRef<ArrayList<Int64>> {
    var a: ArrayList<Int64> = ArrayList<Int64>([0, 1, 2])
    var cache = WeakRef<ArrayList<Int64>>(a, CleanupPolicy.EAGER)
    cache
}

main(){
    var cache = foo()
    var m: HashMap<String, Int64> = HashMap<String, Int64>([("d", 11), ("e", 12)])
    let className1 = Array<A>(5000, {i => A(false)})
    let className2 = Array<B>(5000, {i => B(true)})
    var num_total = className1.size + className2.size
    GC()
    sleep(Duration.second)
    GC()
    var b = match(cache.value){
        case Some(x) => 0
        case None => throw Exception("None")
    }
    return 0
}

