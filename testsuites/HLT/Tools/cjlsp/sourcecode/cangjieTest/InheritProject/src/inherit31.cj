/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkga.* 

open class ABC1 <: A18{
    public func name_1():Unit{}
}

func test31(){
    var a:A18 = ABC1()
    a.name_1
}
