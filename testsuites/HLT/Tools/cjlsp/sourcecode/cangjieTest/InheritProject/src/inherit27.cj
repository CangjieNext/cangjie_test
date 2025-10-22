/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkg1.*

enum E2 <: I11{
    |ZZ
    override public prop ii12:Int64{
        get(){1}
    }
}

func test27(){
    var x1 = E2.ZZ.ii12
}
