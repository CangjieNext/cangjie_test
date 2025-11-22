/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkg1.* 

open class AC2 <: I8<Int64>& I8<Bool>{
    public static func name2<T>():Unit{}
    public open func size1_2(): Unit {}
}
class AC3 <: AC2{
    override public func size1_2(): Unit {}
}

func test24(){
    var a1 = AC3().size1_2
    var a2 = AC2.name2<Int64>()
    var a3 = AC2().size1_2
}
