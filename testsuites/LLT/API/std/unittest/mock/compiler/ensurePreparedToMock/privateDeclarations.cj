/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC-PIPE-1: %compiler %cmp_opt -Woff=all %n.cj -o %output %cmp_utest_opt --mock=on 2>&1 | compare %f

import std.unittest.*
import std.unittest.testmacro.*
import std.unittest.mock.*
import std.unittest.mock.mockmacro.*

private let x = 1
private var y = 2

private func foo() {}

class Foo {
    private static func test1() {}
    private static prop a: String {
        get() {
            ""
        }
    }
    private mut static prop b: String {
        get() {
            ""
        }
        set(x) {}
    }
    private static let c = ""
    private static var d = ""

    func case1(): Unit {
        let stubCall = @EnsurePreparedToMock {=> return (Foo.test1())}
    }
    func case2(): Unit {
        let stubCall1 = @EnsurePreparedToMock {=> return Foo.a}
        let stubCall2 = @EnsurePreparedToMock {=> return Foo.b}
    }
    func case3(): Unit {
        let stubCall1 = @EnsurePreparedToMock {=> return (Foo.c)}
        let stubCall2 = @EnsurePreparedToMock {=> return (Foo.d)}
    }
}

private class Bar {
    static func test1() {}
    static prop a: String {
        get() {
            ""
        }
    }
    mut static prop b: String {
        get() {
            ""
        }
        set(x) {}
    }
    static let c = ""
    static var d = ""
}

private interface Boo {
    static func test1() {}
    static prop a: String {
        get() {
            ""
        }
    }
    mut static prop b: String {
        get() {
            ""
        }
        set(x) {}
    }
}

func case4(): Unit {
    let stubCall1 = @EnsurePreparedToMock {=> return Bar.test1()}
    let stubCall2 = @EnsurePreparedToMock {=> return (Bar.a)}
    let stubCall3 = @EnsurePreparedToMock {=> return (Bar.b)}
    let stubCall4 = @EnsurePreparedToMock {=> return (Bar.c)}
    let stubCall5 = @EnsurePreparedToMock {=> return (Bar.d)}
}

func case5(): Unit {
    let stubCall1 = @EnsurePreparedToMock {=> return (Boo.test1())}
    let stubCall2 = @EnsurePreparedToMock {=> return (Boo.a)}
    let stubCall3 = @EnsurePreparedToMock {=> return (Boo.b)}
}

/* SCAN-IN
error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:37:46:
   | 
37 |         let stubCall = @EnsurePreparedToMock {=> return (Foo.test1())}
   |                                              ^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:40:47:
   | 
40 |         let stubCall1 = @EnsurePreparedToMock {=> return Foo.a}
   |                                               ^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:41:47:
   | 
41 |         let stubCall2 = @EnsurePreparedToMock {=> return Foo.b}
   |                                               ^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:44:47:
   | 
44 |         let stubCall1 = @EnsurePreparedToMock {=> return (Foo.c)}
   |                                               ^^^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:45:47:
   | 
45 |         let stubCall2 = @EnsurePreparedToMock {=> return (Foo.d)}
   |                                               ^^^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:82:43:
   | 
82 |     let stubCall1 = @EnsurePreparedToMock {=> return Bar.test1()}
   |                                           ^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:83:43:
   | 
83 |     let stubCall2 = @EnsurePreparedToMock {=> return (Bar.a)}
   |                                           ^^^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:84:43:
   | 
84 |     let stubCall3 = @EnsurePreparedToMock {=> return (Bar.b)}
   |                                           ^^^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:85:43:
   | 
85 |     let stubCall4 = @EnsurePreparedToMock {=> return (Bar.c)}
   |                                           ^^^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:86:43:
   | 
86 |     let stubCall5 = @EnsurePreparedToMock {=> return (Bar.d)}
   |                                           ^^^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:90:43:
   | 
90 |     let stubCall1 = @EnsurePreparedToMock {=> return (Boo.test1())}
   |                                           ^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:91:43:
   | 
91 |     let stubCall2 = @EnsurePreparedToMock {=> return (Boo.a)}
   |                                           ^^^^^^^^^^^^^^^^^^^ 
   | 

error: static/top-level declaration to mock shouldn't be private, local, constant or constructor
  ==> privateDeclarations.cj:92:43:
   | 
92 |     let stubCall3 = @EnsurePreparedToMock {=> return (Boo.b)}
   |                                           ^^^^^^^^^^^^^^^^^^^ 
   | 

13 errors generated, 13 errors printed.
 */
