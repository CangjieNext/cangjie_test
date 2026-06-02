// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {}

class B {
    init() {
    
    }
}

class C {
    var a = 50
    func cMember() {

    }
}

func foo() {
    var a = 50
}

func goo() {

}


main() {
    var g = goo()
    var f = foo()
    var a = A()
    var b = B()
    var c = C()
    var member = C().cMember()
    0
}