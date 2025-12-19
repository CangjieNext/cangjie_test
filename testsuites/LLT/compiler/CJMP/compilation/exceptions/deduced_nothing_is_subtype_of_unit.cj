// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

// NOTE: type of this function is `Unit -> Unie`
public common func foo() {
  println("foo:common")
}

// SEPARATE-FILE: p/p.cj
// EXEC: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

// NOTE: type of this function is `Unit -> Nothing`
// It's okay, because `Nothing` is subtype of `Unit`
public platform func foo() {
  throw Exception()
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
  let e = @AssertThrows(foo())
  let st = e.getStackTrace()

  checkStackTraceElement(st[0], "cmp", "foo()", "p.cj", 13)
  checkStackTraceElement(st[1], "default", "should_throw()", "main.cj", 15)
}
