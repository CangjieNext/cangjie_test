/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

var list1: Array<String> = ["a", "b", "c"]

main(): Int64 {
    if (test() != 1) {
        return 1
    }
    return 0
}

func test() {
    var a: ArrayList<String> = ArrayList<String>(list1)
    var b = a.foo()
    return b
}

extend<T> ArrayList<T> {
    public func foo() : Int64{
        return 1
    }
}
