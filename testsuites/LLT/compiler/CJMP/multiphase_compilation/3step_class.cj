// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class A {
  public var a = 1
  public common var z: Int = 10

  public init() {}

  public func common() {
      println("common")    
  }

  public common func foo() {
    println("foo:common")
  }
}

// SEPARATE-FILE: p1/p1.cj
// EXEC-0: %compiler %noColor --experimental p1/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-dir=p1 --output-type=chir
package cmp

public specific class A {
  public var b = 2
  public specific var z: Int = 20
  public common var x: Int = 200

  public specific func foo() {
    println("foo:platform1")
  }

  public func platform() {
      println("platform")
  }
}

// SEPARATE-FILE: p2/p2.cj
// EXEC-0: %compiler %noColor --experimental p2/p2.cj p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=dylib
package cmp

public specific class A {
  public var c = 3
  public specific var z: Int = 30
  public specific var x: Int = 300
  public common var y: Int = 3000

  public specific func foo() {
    println("foo:platform2")
  }
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
  println(a.z)
  println(a.x)
  println(a.y)
  a.common()
  a.platform()
  a.foo()
}

/*SCAN
1
2
3
30
300
3000
common
platform
foo:platform2
*/ 
