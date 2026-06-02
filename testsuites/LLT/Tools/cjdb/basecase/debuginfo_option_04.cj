// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A {
    var q = 50
}

var aaa: Option<A> = None
var bbb: Option<A> = Some(A())
var ccc: A = A()

func foo(para1: Option<A>, para2: Option<A>, para3: A) {
    return 0
}

main() {
    var ddd: Option<A> = None
    var eee: Option<A> = Some(A())
    var fff: A = A()
    foo(ddd, eee, fff)
    0
}
