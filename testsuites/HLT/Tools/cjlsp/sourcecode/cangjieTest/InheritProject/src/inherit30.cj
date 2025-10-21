/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkg1.* 

interface II1 <: I14{
    func size1_1(): Unit{}
}

interface II2 <: II1{
    func size1_1(): Unit{}
}

interface II3 <: II2{
    func size1_1(): Unit{}
}
interface II4 <: II3{
    func size1_1(): Unit{}
}
interface II5 <: II4{
    func size1_1(): Unit{}
}

interface II6 <: II5{
    func size1_1(): Unit{}
}

interface II7 <: II6{
    func size1_1(): Unit{}
}

interface II8 <: II7{
    func size1_1(): Unit{}
}

interface II9 <: II8{
    func size1_1(): Unit{}
}

interface II10 <: II9{
    func size1_1(): Unit{}
}

enum EE1<:II10{
    XY
}

func test30(){
    var a1 = EE1.XY.size1_1
    var a2 = XY.size1_1()
}
