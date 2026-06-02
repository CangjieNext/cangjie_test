/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    if (case01() != 1) {
        return 1
    }
    if (case02() != 1) {
        return 2
    }
    if (case03() != 1) {
        return 3
    }
    if (case04(1, 2).aoo() != 1) {
        return 4
    }
    return 0
}

func case01(): Int32 {
    return 1
}

func case02(): Int32 {
    let a = 1
    return Int32(a)
}

func case03(): Int32 {
    let a = 1
    return Int32(a)
}

func case04(a: Int32, b: Int32): A {
    if (a > b) {
        return A()
    } else {
        return B()
    }
}

open class A {
    public let a: Int32 = 2
    public open func aoo() {
        return a
    }
}

class B <: A {
    public let b: Int32 = 1
    public override func aoo() {
        return b
    }
}
