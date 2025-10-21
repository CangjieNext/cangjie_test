/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

func f(x: Array<Int64>): Array<Int64> {
    x
}

func f(x: HashSet<Int64>): HashSet<Int64> {
    x
}

func f(x: HashMap<String, Int64>): HashMap<String, Int64> {
    x
}

func f2<T>(x: T): T {
    x
}

main() {
    let a = [1, 2]
    let a2 = ArrayList<Int64>([0, 1, 2])
    let a3 = HashSet<Int64>([0, 1, 2])
    let a4 = HashMap<String, Int64>([("a", 0), ("b", 1), ("c", 2)])
    let res1 = a |> f
    let res2 = a |> f2<Array<Int64>>
    let res3 = a2 |> f2<ArrayList<Int64>>
    let res4 = a3 |> f2<HashSet<Int64>>
    let res5 = a3 |> f
    let res6 = a4 |> f
    0
}
