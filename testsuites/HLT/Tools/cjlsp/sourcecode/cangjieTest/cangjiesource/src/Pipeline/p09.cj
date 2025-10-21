/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pipeline

interface MyInter {
    static func inter(a: Int64) {
        return a
    }
}
class A1 <: MyInter {}

let i1: Int64 = 1
var i2 = i1 |> A1.inter
