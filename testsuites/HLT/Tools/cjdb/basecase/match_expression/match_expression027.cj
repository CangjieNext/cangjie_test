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


func test1() {
    var d = Derived()
    var r = match (d) {
        case b: Base => b.a
        case _ => 0
    }
    println("r = ${r}")
}


func test2() {
    var b = Base()
    var r = match (b) {
        case d: Derived => d.a
        case _ => 0
    }
    println("r = ${r}")
}

main(){
    test1()
    test2()
    0
}