// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common struct A {
  public common let x: Int = 1
  public let a1 = 2

  public init() {}
}

// SEPARATE-FILE: p1/p1.cj
// EXEC-0: %compiler %noColor --experimental p1/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-dir=p1 --output-type=chir
package cmp

public specific struct A {
  public let a2 = 20
  public specific let x: Int = 10
  public common let y: Int = 30
}

// SEPARATE-FILE: p2/p2.cj
// EXEC-0: %compiler %noColor --experimental p2/p2.cj p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=dylib
package cmp

public specific struct A {
  public let a3 = 200
  public specific let x: Int = 100
  public specific let y: Int = 300
}

// SEPARATE-FILE: main.cj
// EXEC-PIPE-0: %compiler %noColor main.cj -lcmp -L. -o %output
// RUN: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  let a = A()
  println(a.a1)
  println(a.a2)
  println(a.a3)
  println(a.x)
  println(a.y)
}

/*SCAN
1
20
300
100
300
*/ 
