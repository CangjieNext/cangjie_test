/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

import default.signature.pkg4.*

open class AA {}
class BB <: AA {
    BB(x: Int64) {}
}

var o1 = hh_1<AA>(AA())
var o2 = hh_2<BB>(BB(33))
