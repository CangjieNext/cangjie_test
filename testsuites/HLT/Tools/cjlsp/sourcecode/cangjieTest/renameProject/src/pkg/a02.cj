/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

interface II1 {}
interface II2 {}
class A <:II1 & II2 {}

func a3() {
    let i1:A = A()
    let z = i1 as II1
    let z1 =i1 as II2
    let z2 = i1 as A
}
