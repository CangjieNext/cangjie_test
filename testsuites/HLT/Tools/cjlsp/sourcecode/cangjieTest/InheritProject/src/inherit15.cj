/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkge.A15

type AA15 = A15

type AAA15 = AA15

class B15 <: AA15{
    redef static func name_1() {}
}
class C15 <: AAA15{
    redef static func name_1() {}
}

func test15(){
    var a1 = C15.name_1
    var a2 = AAA15.name_1()
}
