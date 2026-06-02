/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface Base{}

class Derived <: Base {
    var a: Int64
    public init() {
        a = 20
    }
}


main() {
    var d = Derived()
    var r = match (d) {
        case b: Base => d.a
        case _ => 0
    }
    println("r = ${r}")
}
