/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkga.* 

class BA7 <: A21{
    override public func name2(bias:Float16):Float16{
        return bias
    }
}

func test38(){
    var a = BA7().name2(8.9)
}
