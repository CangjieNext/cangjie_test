/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01() != 1) {
        return 1
    }
    return 0
}

func case01() {
    let score = 80
    let a = {=> 70}
    let b = {=>}
    var c: A = match ({=>}) {
        case a => A()
        case _ => B()
    }
    return c.a
}

open class A {
    public var a: Int32 = 1
}

class B <: A {
    public var b: Int32 = 2
}
