/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkga.*

class B5 <: A5{
    public override func name_1() :Unit{}
}

func test5(){
    var a = B5().name_1()
    var b = A5().name_1()
}
