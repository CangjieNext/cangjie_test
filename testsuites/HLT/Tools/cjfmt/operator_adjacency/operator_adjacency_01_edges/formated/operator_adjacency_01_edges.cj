/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func edges(a: Int64, b: Int64): Int64 {
    var t: Int64 = 0
    var u: Int64 = 0
    u++
    u--
    t = a + -b
    t = a * -b
    t = a % -b
    t = a & -1
    return t + u
}

func logic(p: Bool, q: Bool): Bool {
    return !p == q || p && !q
}

func sliceNeg(arr: Array<Int64>): Int64 {
    let r = arr[0..-1]
    return r[0]
}

func rangeNeg(): Int64 {
    var total: Int64 = 0
    for (i in -3..0) {
        total += i
    }
    let rev = -5..-1
    for (i in rev) {
        total += i
    }
    return total
}

main() {
    println(edges(1, 2))
    println(logic(true, false))
    println(sliceNeg([1, 2, 3]))
    println(rangeNeg())
}
