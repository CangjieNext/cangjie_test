/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func unary(): Int64 {
    var x = 0
    x++
    x--
    let n = -5
    let flag: Bool = !true
    if (flag) {
        return n
    }
    return x
}

func ranges(): Int64 {
    var total = 0
    for (i in 0..5) {
        total += i
    }
    for (i in 10..=15) {
        total += i
    }
    let rev = 10..0 : -2
    for (i in rev) {
        total += i
    }
    return total
}

class Chain {
    public func v(): Int64 {
        return 5
    }
}

func chains(): Int64 {
    let c = Chain()
    let r = c.v()
    let arr: Array<Int64> = [1, 2]
    return r + arr[0] + c.v()
}

func doWhile(): Int64 {
    var n = 0
    do {
        n++
    } while (n < 2)
    return n
}

main() {
    println(unary())
    println(ranges())
    println(chains())
    println(doWhile())
}
