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

  public common func foo(): Unit {
    throw Exception()
  }
}

public func goo() {
    A().foo()
  }

// SEPARATE-FILE: p/p.cj
// EXEC: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public platform class A {
  public platform func foo() {
    println("ok-no-throw")
  }
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor main.cj -lcmp -L. -o %output
// EXEC: %run %output 2>&1 | compare %f
// ASSERT: scan ok-no-throw
import cmp.*

main() {
    goo()
}
