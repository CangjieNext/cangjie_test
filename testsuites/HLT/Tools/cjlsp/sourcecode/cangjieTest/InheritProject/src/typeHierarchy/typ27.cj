/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.typeHierarchy

open class AG1 {}
open class NN2 <: AG1 {
    static var num = 8
}
type NEW = NN2
class AG2 <: NEW {}

var o1: NEW = NEW()
var o2 = NEW.num
