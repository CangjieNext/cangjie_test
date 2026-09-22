/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func arith(a: Int64, b: Int64): Int64 {
    var r = a+b
    r = a-b
    r = a*b
    r = a/b
    r = a%b
    r = a**2
    r += 1
    r -= 1
    r *= 2
    r /= 2
    r %= 3
    return r
}

func compare(a: Int64, b: Int64): Bool {
    let e = a==b
    let n = a!=b
    let l = a<b
    let g = a>b
    let le = a<=b
    let ge = a>=b
    return e && n || l && g && le && ge
}

func bitwise(a: Int64, b: Int64): Int64 {
    var r = a&b
    r = a|b
    r = a^b
    r = a<<2
    r = a>>1
    return r
}

main() {
    println(arith(7 , 2))
    println(compare(1 , 2))
    println(bitwise(12 , 10))
}
