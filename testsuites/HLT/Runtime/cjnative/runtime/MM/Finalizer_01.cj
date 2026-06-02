/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.runtime.*
import std.collection.*

var count: Int64 = 0;
var list: ArrayList<FinalClass> = ArrayList<FinalClass>();

class FinalClass {
    public var n: Int64
    public init() {
        n = count
        count++
    }

    ~init() {
        count--
    }

    public func getNum(): Int64 {
        return n
    }
}

func test(): Int64 {
    let f1: FinalClass = FinalClass()
    let f2: FinalClass = FinalClass()
    list.add(f1)
    list.add(f2)
    if (f1.getNum() != 0) {
        return 1
    } else if (f2.getNum() != 1) {
        return 1
    } else if (count != 2) {
        return 1
    }
    list.remove(0..2)
    return 0
}

main(): Int64 {
    if (test() != 0) {
        return 1
    }
    GC()
    while (count != 0) {
        sleep(Duration.Zero)
    }
    return 0
}
