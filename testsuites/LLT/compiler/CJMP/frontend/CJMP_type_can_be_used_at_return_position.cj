// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class Net {
    public init() {}
}
public common struct Net2 {
    public init() {}
}
public common interface Net3 {}

public common func foo(): Array<Net> {
  println("common:foo")
  return []
}

public common func foo2(): Array<Net2> {
  println("common:foo")
  return []
}

public common func foo3(): Array<Net3> {
  println("common:foo")
  return []
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public specific class Net {}
public specific struct Net2 {}
public specific interface Net3 {}

public specific func foo(): Array<Net> {
  println("specific:foo")
  return []
}

public specific func foo2(): Array<Net2> {
  println("specific:foo2")
  return []
}

public specific func foo3(): Array<Net3> {
  println("specific:foo3")
  return []
}

public func call() {
  foo()
  foo2()
  foo3()
}

// SEPARATE-FILE: main.cj
// EXEC-0: %compiler %noColor main.cj -lcmp -L. -o %output
// EXEC-PIPE: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  call()
  foo()
  foo2()
  foo3()
}

/* SCAN
specific:foo
specific:foo2
specific:foo3
specific:foo
specific:foo2
specific:foo3
*/ 
