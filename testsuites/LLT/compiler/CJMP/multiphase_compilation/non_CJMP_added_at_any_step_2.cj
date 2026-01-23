// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public class A1 {
  public func foo() { println("A1") }
}

public struct B1 {
  public func foo() { println("B1") }
}

public enum C1 {
  | C1

  public func foo() { println("C1") }
}

public var d1 = "d1"

// SEPARATE-FILE: p1/p1.cj
// EXEC-0: %compiler %noColor --experimental p1/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-dir=p1 --output-type=chir
package cmp

public class A2 {
  public func foo() { println("A2") }
}

public struct B2 {
  public func foo() { println("B2") }
}

public enum C2 {
  | C2

  public func foo() { println("C2") }
}

public var d2 = "d2"

// SEPARATE-FILE: p2/p2.cj
// EXEC-0: %compiler %noColor --experimental p2/p2.cj p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=dylib
package cmp

public class A3 {
  public func foo() { println("A3") }
}

public struct B3 {
  public func foo() { println("B3") }
}

public enum C3 {
  | C3

  public func foo() { println("C3") }
}

public var d3 = "d3"

// SEPARATE-FILE: main.cj
// EXEC-PIPE-0: %compiler %noColor main.cj -lcmp -L. --import-path=./p2/cmp.cjo -o %output
// RUN: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  A1().foo()
  B1().foo()
  C1.C1.foo()
  println(d1)

  A2().foo()
  B2().foo()
  C2.C2.foo()
  println(d2)

  A3().foo()
  B3().foo()
  C3.C3.foo()
  println(d3)
}

/*SCAN
A1
B1
C1
d1
A2
B2
C2
d2
A3
B3
C3
d3
*/ 
