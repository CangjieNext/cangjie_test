/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pipeline

func foo(): Unit {
    func foo1(a: Int64) {
        a
    }
    let f1: Int64 = 1
    var res11 = f1 |> foo1
}
