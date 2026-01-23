// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common func g<T>(v: T) where T <: ToString {
  println("g(${v})1")
}

public common interface A<T> {
  public common func notImpl<G>(v: G): Unit where G <: ToString

  public common func goo<T>(v: T) {
    println("goo1")
  }
}

// SEPARATE-FILE: p1/p1.cj
// EXEC-0: %compiler %noColor --experimental p1/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-dir=p1 --output-type=chir
package cmp

public specific func g<T>(v: T) where T <: ToString {
  println("g(${v})2")
}

public specific interface  A<T> {
  public specific func goo<T>(v: T) {
    println("goo2")
  }
}

public common class B<T> <: A<T> & ToString {
  public common func notImpl<G>(v: G): Unit where G <: ToString {
      println("notImpl(${v})1")
    }

  public init() {}

  public func toString() {
      "ok"
    }
}

// SEPARATE-FILE: p2/p2.cj
// EXEC-0: %compiler %noColor --experimental p2/p2.cj p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=dylib
package cmp

public specific func g<T>(v: T) where T <: ToString {
  println("g(${v})3")
}

public specific interface  A<T> {
}

public specific class B<T> <: A<T> & ToString {
  public specific func notImpl<G>(v: G): Unit where G <: ToString {
      println("notImpl(${v})2")
  }
}

// SEPARATE-FILE: main.cj
// EXEC-PIPE-0: %compiler %noColor main.cj -lcmp -L. --import-path=./p2/cmp.cjo -o %output
// RUN: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  g<Int>(42)
  let b = B<A<String>>()
  b.goo(1)
  b.notImpl<B<A<String>>>(b)
}

/*SCAN
g(42)3
goo2
notImpl(ok)2
*/ 
