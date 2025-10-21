/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.As

interface I3 {}
interface I4 {}
open class A4{}
class B4 <:A4 & I3 & I4 {}

func a4() {
    let ii1:A4 = A4()
    let ii2:A4 = B4()
    let ii3:B4 =B4()

    let t1 = ii1 as A4
    let t2 = ii1 as B4
    let t3 = ii1 as I3
    let t4 = ii1 as I4
    let t5 = ii2 as A4
    let t6 = ii2 as B4
    let t7 = ii2 as I3
    let t8 = ii2 as I4
    let t9 = ii3 as A4
    let t10 = ii3 as B4
    let t11 = ii3 as I3
    let t12 = ii3 as I4

}
