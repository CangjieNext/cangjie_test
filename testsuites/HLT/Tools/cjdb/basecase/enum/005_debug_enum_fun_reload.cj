/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




package p

enum E {
    | f(Int64)
    | f(Int64, Int64, Int64)
}
func f(a: Int64) {
    return a
}
func f(a: Int64, b: Int64) {
    return a + b
}


main() {
    let num1: Int64 = f(1) // ok
    let num2 = E.f(1) // ok
    let num3: Int64 = f(1, 2) // ok, find f(a: Int64, b: Int64)
    let num4 = E.f(1, 2, 3) // ok, find E.f(Int64, Int64, Int64)
    let howMany: Int64 = match (num4) {
        case f(y, m, d) => y + m + d  // matched
        case _ => 0
    }

    return 0
}
