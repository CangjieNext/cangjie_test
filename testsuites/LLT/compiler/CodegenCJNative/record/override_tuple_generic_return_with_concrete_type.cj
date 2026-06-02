// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

interface I<T> {
    func get(): T
}

class PairImpl <: I<(Int64, Int64)> {
    public override func get(): (Int64, Int64) {
        return (1, 2)
    }
}

func useAsIface(): (Int64, Int64) {
    let i: I<(Int64, Int64)> = PairImpl()
    return i.get()
}

func forward(i: I<(Int64, Int64)>): (Int64, Int64) {
    return i.get()
}

func sum(pair: (Int64, Int64)): Int64 {
    let (a, b) = pair
    return a + b
}

main(): Int64 {
    let direct = PairImpl().get()
    let iface = useAsIface()
    let forwarded = forward(PairImpl())
    if (sum(direct) != 3 || sum(iface) != 3 || sum(forwarded) != 3) {
        return 1
    }
    return 0
}
