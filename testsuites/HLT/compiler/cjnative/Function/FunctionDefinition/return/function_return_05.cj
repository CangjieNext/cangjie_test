/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

//函数体中所有 return e 表达式中 e 的类型是标注的类型（ Type ）的子类型，否则编译报错
main(): Int64 {
    if (case01() != 1) {
        return 1
    }
    if (case02() != 1) {
        return 2
    }
    if (case04(1, 2).aoo() != 1) {
        return 4
    }
    return 0
}

func case01(): Int32 {
    let a = 1
    return a
}

func case02(): Int32 {
    let a = 1
    return Int64(a)
}

func case04(a: Int32, b: Int32): B {
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
// ASSERT: scan sema_mismatched_types
