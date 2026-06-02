/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Class

open class AA {
    var aa = 1
}

class BB <: AA {
    var dd = "ff"
}
open class CC <: AA {
    var bb = 1
}

class DD <: CC {
    var cc = BB()
}

var v1 = DD().cc.dd
var v2 = DD().cc
var v3 = DD().aa
var v4 = AA().aa
