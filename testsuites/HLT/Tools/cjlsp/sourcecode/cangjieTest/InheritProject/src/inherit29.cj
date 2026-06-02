/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkg1.* 

struct SS1{}
extend SS1 <: I12<Int64>&I12<Bool> & I13 {
    public prop ii:Int64{
        get() {
            2
        }
    }
    public func size1_1(): Unit {}
}

func test29(){
    var a = SS1().ii
    var b = SS1().size1_1
}
