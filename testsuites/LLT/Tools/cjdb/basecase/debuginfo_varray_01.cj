// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.collection.*

main() {
    var f = varrayfunc([4, 5, 6])
    var cls = c()
    var s = s()
    var a1: VArray<Int64, $3> = [1, 2, 3]
    var a2: VArray<Int64, $3> = [4, 5, 6]
    0
}

class c {
    var a1: VArray<Int64, $3> = [1, 2, 3]
    var a2: VArray<Int64, $3> = [4, 5, 6]
    var c = 50
}

struct s {
    var a1: VArray<Int64, $3> = [1, 2, 3]
    var a2: VArray<Int64, $3> = [4, 5, 6]
    var c = 50
}

func varrayfunc(a: VArray<Int8, $3>, b!: VArray<Int8, $3> = [2, 3, 4]) {
    println(a[0])
    println(a[1])
    println(a[2])
    println(b[0])
    println(b[1])
    println(b[2])
    return 0
}
