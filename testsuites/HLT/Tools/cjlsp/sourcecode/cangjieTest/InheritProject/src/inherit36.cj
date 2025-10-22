/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default
import default.pkg1.* 
import default.pkga.A20

interface K8{
    open prop  ii:Int64
}

class BA4 <: A20 & I15 &K8{
    redef public static func name() :Unit{}
    public func size1_1(): Unit{}
    public prop  ii:Int64{
        get(){1}
    }
}

func test36(){
    var a = BA4().ii
    var b = BA4.name
    var c = BA4().size1_1()
}
