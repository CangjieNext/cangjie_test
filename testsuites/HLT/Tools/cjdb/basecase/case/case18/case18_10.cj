/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main(): Int64 {
    func f(x: Int32): Int32 {
        x + 1
    }
    let a: Int32 = 1
    var res = a |> f
    var res1 = a |> {x: Int32 => x + 1}
    func h(b: Bool) {
        b
    }
    let res3 = a < 0 || a > 10 |> h
    func g<T>(x: T): T {
        x
    }
    var res4 = a |> g<Int32>
    let lambdaComp = {x: Int32 => x} ~> f

    func h1<T>(x: T): T {
        x
    }
    func h2<T>(x: T): T {
        x
    }
    var hh = h1<Int32> ~> h2<Int32>
    return 0
}
