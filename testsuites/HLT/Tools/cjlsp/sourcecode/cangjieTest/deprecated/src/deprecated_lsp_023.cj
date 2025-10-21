/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

@Deprecated
var 中文: String = "Cangjie"

func testcase23() {
    //test
    let cc = 中文
}

func test23() {
    @Deprecated
    var g = {x: Int64 => println("x = ${x}")}
    //test
    g(2)
}

@Deprecated
func inc(x: Array<Int64>): Array<Int64> {
    let s = x.size
    var i = 0
    for (e in x where i < s) {
        x[i] = e + 1
        i++
    }
    x
}

@Deprecated
func sum(y: Array<Int64>): Int64 {
    var s = 0
    for (j in y) {
        s += j
    }
    s
}

let arr: Array<Int64> = [1, 3, 5]
//test
let res = arr |> inc |> sum
