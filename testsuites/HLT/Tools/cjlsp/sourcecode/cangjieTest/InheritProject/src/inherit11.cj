/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkga.*

class B11 <: A11<Int64>{
    override public func name_1():Unit{}
}

class C11 <: A11<Bool>{
    override public func name_1():Unit{}
}

func test11(){
    var a = A11<Int64>().name_1
    var b = B11().name_1
}
