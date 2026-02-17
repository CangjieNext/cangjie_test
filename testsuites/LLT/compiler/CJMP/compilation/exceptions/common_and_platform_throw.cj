// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class A {
  public init () {}

  public common func foo() {
    throw Exception()
  }
}

public func goo() {
    A().foo()
  }

// SEPARATE-FILE: p/p.cj
// EXEC: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public specific class A {
  public specific func foo() {
    throw Exception("Asking for landing")
  }
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor --test main.cj -lcmp -L. -o %output
// EXEC: %run %output
import cmp.*
import std.fs.*

func checkStackTraceElement(st: StackTraceElement, className: String, methodName: String, fileName: String, lineNumber: Int) {
  @Expect(st.declaringClass, className)
  @Expect(st.methodName, methodName)
  let path = Path(st.fileName)
  @Expect(path.fileName, fileName)
  @Expect(st.lineNumber, lineNumber)
}

@Test func should_throw() {
  let e = @AssertThrows(goo())
  let st = e.getStackTrace()

  @Expect(e.message, "Asking for landing")
  checkStackTraceElement(st[0], "cmp", "A::foo()", "p.cj", 11)
  checkStackTraceElement(st[1], "cmp", "goo()", "c.cj", 25)
  checkStackTraceElement(st[2], "default", "should_throw()", "main.cj", 15)
}
