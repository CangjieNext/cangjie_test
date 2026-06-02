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
// ASSERT:scan 243228

import std.runtime.*

class Object1 {
    public var var1: Int32 = 4
    public var var2: Int64 = 24
}

class Object2 {
    public var var1: Int32 = 8
    public var ref: Object1 = Object1()
}

func Func1() {
    var obj1: Object1 = Object1()
    GC()
    print((obj1.var2).toString())
}

func Func2() {
    var obj2: Object2 = Object2()
    Func1()
    print((obj2.ref.var2 + Int64(obj2.var1)).toString())
}

main(): Int64 {
    var obj1: Object1 = Object1()
    Func2()
    print((obj1.var2 + Int64(obj1.var1)).toString())
    return 0
}
