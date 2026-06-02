/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1 EXCLUDE
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

// 一类型extend多个操作符TR,TR中构造函数重名

interface TR1 {
    operator func [](b: Bool): Bool
    operator func **(b: Bool): Bool
}

interface TR2 {
    operator func [](b: Bool): Int32
    operator func **(b: Bool): Int32
    operator func *(b: Bool): Bool
    operator func /(b: Bool): Bool
    operator func %(b: Bool): Bool
    operator func +(b: Bool): Bool
    operator func -(b: Bool): Bool
}

extend Int32 <: TR1 & TR2 {
    public operator func [](b: Bool): Bool {
        true
    }
    public operator func [](b: Bool): Int32 {
        1
    }
    public operator func **(b: Bool): Bool {
        true
    }
    public operator func **(b: Bool): Int32 {
        2
    }
    public operator func *(b: Bool): Bool {
        true
    }
    public operator func /(b: Bool): Bool {
        true
    }
    public operator func %(b: Bool): Bool {
        true
    }
    public operator func +(b: Bool): Bool {
        true
    }
    public operator func -(b: Bool): Bool {
        true
    }
}

main(): Int64 {
    var a: Bool = false
    var b: Int32 = 1
    if (!(b[a])) {
        return 1
    }
    if (!(b ** a)) {
        return 8
    }
    if (!(b * a)) {
        return 9
    }
    if (!(b / a)) {
        return 10
    }
    if (!(b % a)) {
        return 11
    }
    if (!(b + a)) {
        return 13
    }
    if (!(b - a)) {
        return 14
    }
    return 0
}
// ASSERT: scan sema_overload_conflicts
