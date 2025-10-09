/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func add<T>(c: T, a: Int64): Int64 {
    var ax: T = c
    return a
}

func add2<T>(c: T, a: Int64): Int64 {
    var ax: T = c
    return a
}

main(): Int64 {
    add(1, 2)
    add2<Int64>(1, 4)
    return 0
}
