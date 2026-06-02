// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import std.unittest.*
import std.unittest.testmacro.*

class A {
    public var a: Int64
    public init(a: Int64) {
        this.a = a
    }
}

@Test
class B {
    @TestCase
    func test(): Unit {
        var ss: A
        if (let ss <- A(1)) {
            println("this is sucess try-with")
        }
    }
}
