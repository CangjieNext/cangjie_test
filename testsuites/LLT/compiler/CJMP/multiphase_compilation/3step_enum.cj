// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common enum A {
  | A1

  public common func foo() {
    println("foo:common")
  }
}

public common enum B <: ToString {
    | B1    
    | ...

  public common func toString() {
    match (this) {
        case B1 => "b1"
        case _ => "other"
    }
  }
}

public common enum C <: ToString {
    | C1    
    | ...

  public common func toString() {
    match (this) {
        case C1 => "c1:1"
        case _ => "other:1"
    }
  }
}

// SEPARATE-FILE: p1/p1.cj
// EXEC-0: %compiler %noColor --experimental p1/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-dir=p1 --output-type=chir
package cmp

public specific enum A {
  | A1

  public specific func foo() {
    println("foo:platform1")
  }
}

public specific enum B <: ToString {
  | B1
  | B2

  public specific func toString() {
    match (this) {
        case B1 => "b1"
        case B2 => "b2"
    }
  }
}

public specific enum C <: ToString {
  | C1
  | C2
  | ...

  public specific func toString() {
    match (this) {
        case C1 => "c1:2"
        case C2 => "c2:2"
        case _ => "other:2"
    }
  }
}

// SEPARATE-FILE: p2/p2.cj
// EXEC-0: %compiler %noColor --experimental p2/p2.cj p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=dylib
package cmp

public specific enum A {
  | A1

  public specific func foo() {
    println("foo:platform2")
  }
}

public specific enum C <: ToString {
  | C1
  | C2
  | C3

  public specific func toString() {
    match (this) {
        case C1 => "c1:3"
        case C2 => "c2:3"
        case C3 => "c3:3"
    }
  }
}

// SEPARATE-FILE: main.cj
// EXEC-PIPE-0: %compiler %noColor main.cj -lcmp -L. -o %output
// RUN: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  let a1 = A.A1
  a1.foo()

  let b2 = B.B2
  println(b2)

  println(C.C1)
  println(C.C2)
  println(C.C2)
}

/*SCAN
foo:platform2
b2
c1:3
c2:3
c3:3
*/ 
