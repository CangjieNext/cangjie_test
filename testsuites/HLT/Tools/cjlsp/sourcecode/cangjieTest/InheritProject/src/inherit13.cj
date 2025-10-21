/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkge.A13 as AA13

class B13 <: AA13{
    public prop ii_1:Int64{
        get(){1}
    }
}

func test13(){
    var a = B13().ii_1
}
