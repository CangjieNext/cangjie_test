/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkge.AA14

class B14 <: AA14{
    override public func name1_1() :Unit{}
}

var m1 = B14().name1_1
var m2 = AA14().name1_1()
