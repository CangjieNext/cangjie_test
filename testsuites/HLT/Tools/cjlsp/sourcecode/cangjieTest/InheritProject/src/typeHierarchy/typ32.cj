/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.typeHierarchy

open class BE1{
    BE1(){}
    init(x:Int64) {}
    var gg = 6
}

class BE2 <: BE1{}

func f1(a:BE1) {}


var aq1:BE1 = BE2()
var aq2:BE1 = BE1()
