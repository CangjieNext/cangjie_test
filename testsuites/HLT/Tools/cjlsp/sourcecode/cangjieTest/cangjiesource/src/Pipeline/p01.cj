/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pipeline

open class A {
    var c1: Int32 = 1
}
let ab = A()
let ac = ab.c1 |> {x: Int32 => ab.c1 + 1}
