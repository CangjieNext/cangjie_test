/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkg1.* 

open class BA5 <: CA1 & I16{
    public static func name(a:Int64):Unit{}
}

class BA6 <: I16{
    public static func name():Unit{}
    public func size1(): Unit{}
}

func test37(){
    var a = BA6().size1
    var b = BA5.name(6)
}
