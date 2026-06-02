// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

interface A0 {
    func fa(): Unit {
        println("call func fa.")
    }
}
open class A <: A0 {}
class B <: A {}
main() {
    var ic: A = B()
    ic.fa()
    0
}
