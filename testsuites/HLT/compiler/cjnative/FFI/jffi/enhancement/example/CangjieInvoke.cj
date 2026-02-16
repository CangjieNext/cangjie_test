/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package UNNAMED

import java.lang.JObject
import std.unittest.*
import std.unittest.common.*
import std.unittest.testmacro.*

@JavaImpl
public class Impl <: JObject {
    public init() {
        println("hello")
        // let i = ImplAbstractMirror()
        // let res = i.id(i)
        // ImplAbstractMirror.staticFunc()

        // match (res) {
        //     case AbstractMirror => println("id match: ok")
        //     case ImplAbstractMirror => println("id match: failed")
        //     case _ => println("id match: unexpected case")
        // }

        // match (res) {
        //     case ImplAbstractMirror => println("id match: ok")
        //     case AbstractMirror => println("id match: failed")
        //     case _ => println("id match: unexpected match")
        // }

        // res.abstractFunc()
        // print("cast to ImplAbstractMirror: ", flush: true)
        // (res as ImplAbstractMirror)?.abstractFunc()

        // let res2 = i.idImpl(i)
    }
}

public class MyClass {
    public func foo(): Unit {
        println("foo")
        TestJavaInterop().asTestSuite().runTests().reportTo(ConsoleReporter())
        println("goo")
    }
}

@Test
class TestJavaInterop {
    @TestCase
    func test00(): Unit {
        @Expect(true)
    }
}
