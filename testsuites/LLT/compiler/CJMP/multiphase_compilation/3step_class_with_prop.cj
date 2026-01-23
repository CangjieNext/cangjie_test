// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class A {
  public common prop a: Int
  public common prop b: Int

  public init() {}
}

// SEPARATE-FILE: p1/p1.cj
// EXEC-0: %compiler %noColor --experimental p1/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-dir=p1 --output-type=chir
package cmp

public specific class A {
  public specific prop a: Int { get() { 2 } }
  public common prop c: Int { get() { 20 } } 
}

// SEPARATE-FILE: p2/p2.cj
// EXEC-0: %compiler %noColor --experimental p2/p2.cj p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=dylib
package cmp

public specific class A {
  public specific prop a: Int { get() { 3 } }
  public specific prop b: Int { get() { 30 } }
  public specific prop c: Int { get() { 300 } }
}

// SEPARATE-FILE: main.cj
// EXEC-PIPE-0: %compiler %noColor main.cj -lcmp -L. --import-path=./p2/cmp.cjo -o %output
// RUN: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  let a = A()
  println(a.a)
  println(a.b)
  println(a.c)
}

/*SCAN
3
30
300
*/ 
