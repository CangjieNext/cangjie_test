/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func inc<T>(x: Array<Int64>): Array<Int64> {
    let s = x.size
    var i = 0
    for (e in x where i < s) {
        x[i] = e + 1
        i++
    }
    x
}

func sum<T>(y: Array<Int64>): Int64 {
    var s = 0
    for (j in y) {
        s += j
    }
    s
}

func h1<T>(x: T): T { x }
func h2<T>(x: T): T { x }

main():Int64 {
    let arr: Array<Int64> = [1, 3, 5]
    let res = arr |> inc<Int64> |> sum<Int64>
    var hh = h1<Int64> ~> h2<Int64>
    return 0
}
