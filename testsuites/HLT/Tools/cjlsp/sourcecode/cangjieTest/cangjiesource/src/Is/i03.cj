/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Is

interface I1 {}
interface I2 {}
class IsA <: I1 & I2 {}

func a3() {
    let i1: IsA = IsA()
    let z = i1 is I1
    let z1 = i1 is I2
    let z2 = i1 is IsA
}
