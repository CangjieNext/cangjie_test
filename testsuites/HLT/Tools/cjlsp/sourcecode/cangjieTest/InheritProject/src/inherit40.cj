/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkg1.* 

interface K9 <: I20{
    override func size1_2(a:Int64,b!:Float16):Unit {}
}
class BA9 <: I20{
    public func size1_2(a:Int64,b!:Float16):Unit {}
}

func test40(){
    var a = BA9().size1_2(6, b: 9.0)
}
