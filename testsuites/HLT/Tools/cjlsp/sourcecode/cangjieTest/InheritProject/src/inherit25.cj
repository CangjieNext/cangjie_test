/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkg1.* 

class AC4 <: I9{
    public func size1_2():Unit{}
}

struct S1 <: I9{
    public func size1_2():Unit{}
}

enum E1 <: I9{
    AA
    public func size1_2():Unit{}
}

func test25(){
    var a = AC4().size1_2
    var b = S1().size1_2()
    var c = E1.AA.size1_2
}
