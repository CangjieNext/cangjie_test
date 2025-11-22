/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

class AM{
    public var a: Int64
    public var b: Int64
    public init(x: Int64){
        a = x
        b = x
    }
    public operator func +( index: AM): AM{
        return index
    }
    public operator func []( index: Int64, value!: Int64): Unit{
        this.b = value
    }
}

func f4(): Int64{
    var a = AM(2)
    var b  = AM(7)
    var c = a+b
    a [2] = 4
    return 1
}
