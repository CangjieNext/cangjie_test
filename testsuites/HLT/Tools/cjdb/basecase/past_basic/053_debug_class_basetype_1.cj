/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class A {
    var var1: Bool = true
    var var2: Unit = ()
    var var3: Rune = '7'
    func foo() {
        print("hello")
    }
}

open class B <: A {
    var var11: Bool = false
    var var22: Unit = ()
    var var33: Rune = 'c'
}

open class C <: B {
    var var111: Bool = false
    var var222: Unit = ()
    var var333: Rune = '哈'
    var var444 = A()
} 

main() {
    var a:A = A()
    var b:B = B()
    var c:C = C()
}
