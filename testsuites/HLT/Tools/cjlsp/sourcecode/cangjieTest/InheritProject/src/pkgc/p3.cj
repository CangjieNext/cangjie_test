/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkgc

import default.pkgb.*


class AA9 <: A9{
    public override func f9_1() :Unit{}
    redef public static func ff9_1():Unit{}
}


class CC9 <: A9{
    public override func f9_1() :Unit{}
    redef public static func ff9_1():Unit{}
}

func fh(){
    var a = CC9.ff9_1
    var b = CC9().f9_1()
    var c = A9.ff9_1
}
