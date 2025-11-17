/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func name(x1: Int64) {
    var aa = 8
    return x1
}

func name<T>(x1: (Bool) -> T, y1: Int64) {
    var a = x1
    var b: Int32 = 20
    x1(true)
    return b
}

func name(x1: Bool, y1: Int32, z1!: Float64) {
    var a1: Int32
    a1 = y1
    var b1: Int32 = y1
    return a1 + b1
}

main(): Int64 {
    var a = name(1)
    name<Bool>({aa => true}, 6)
    name(true, 1, z1: 2.2)
    return 0
}
