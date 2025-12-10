// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common class Net {}
public common struct Net2 {}
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
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib
package cmp

public platform class Net {}
public platform struct Net2 {}
public platform interface Net3 {}

public platform func foo(): Array<Net> {
  println("platform:foo")
  return []
}

public platform func foo2(): Array<Net2> {
  println("platform:foo2")
  return []
}

public platform func foo3(): Array<Net3> {
  println("platform:foo3")
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
platform:foo
platform:foo2
platform:foo3
platform:foo
platform:foo2
platform:foo3
*/ 
