/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkgb.*

open class B9 <: A9{
    public override func f9_1() :Unit{}
    redef public static func ff9_1():Unit{}
}

open class C9 <: A9{
    public override func f9_1() :Unit{}
    redef public static func ff9_1():Unit{}
}

open class D9 <: A9{
    public override func f9_1() :Unit{}
    redef public static func ff9_1():Unit{}
}

func test9(){
    var a = A9.ff9_1
    var b = B9.ff9_1
    var c = C9.ff9_1
    var d = D9.ff9_1()
    var b1 = B9().f9_1()
}
