/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public specific interface I {
    public specific mut func f(): Unit {
        println("aa")
    }
}

public struct Foo <: I {
    public var v = 0
    public mut func f(): Unit {
        v += 1
    }
}
