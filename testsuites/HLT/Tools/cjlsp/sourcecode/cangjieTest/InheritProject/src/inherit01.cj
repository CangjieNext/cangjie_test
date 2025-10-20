/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkga.*

class B1 <: A1{
    public mut prop  ii_1:Int64{
        get(){1}
        set(v){}
    }
}

func test1(){
    var a1 = B1().ii_1
}
