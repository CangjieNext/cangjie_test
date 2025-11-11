/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Base {
    var a: Int64
    public init() {
        a = 10
    }
}
class Derived <: Base {
    public init() {
        a = 20
    }
}
main() {
    var d = Derived()
    var r = match (d) {
        case _ => 0
        case b: Base => b.a // Matched.
       
    }
    println("r = ${r}")
}

