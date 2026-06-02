/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package D1
import default.pkga.*

class DD <: A23{
    public mut prop ii1:Int64{
        get(){1}
        set(v){}
    }
}
class EE <: A24{
    public func gg_1():Unit{}
}

func h1(){
    var a1 = DD().ii1
    var a2 = A24().gg_1
}
