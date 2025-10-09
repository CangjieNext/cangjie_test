/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pipeline

class P6 {
    let d1: Int32 = 1
    func f(a: Int32): Int32 {
        return a
    }

    func test() {
        d1 |> f
    }
}
let aa = P6()
func test2() {
    aa.d1 |> aa.f
}
