// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common func foo() {
  println("foo:common")
}

public common func goo() {
  println("goo:common")
}

// SEPARATE-FILE: p1/p1.cj
// EXEC-0: %compiler %noColor --experimental p1/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-dir=p1 --output-type=chir
package cmp

public common func boo() {
  println("boo:common")
}

public specific func goo() {
  println("goo:platformA")
}

// SEPARATE-FILE: p2/p2.cj
// EXEC-0: %compiler %noColor --experimental p2/p2.cj p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-dir=p2 --output-type=chir
package cmp

public specific func boo() {
  println("boo:platform")
}

public common func doo() {
  println("doo:common")
}

// SEPARATE-FILE: p3/p3.cj
// EXEC-0: %compiler %noColor --experimental p3/p3.cj p2/cmp.chir --common-part-cjo=./p2/cmp.cjo --output-type=dylib
package cmp

public specific func foo() {
  println("foo:platform")
}

public specific func goo() {
  println("goo:platformB")
}

// SEPARATE-FILE: main.cj
// EXEC-PIPE-0: %compiler %noColor main.cj -lcmp -L. --import-path=./p3/cmp.cjo -o %output
// RUN: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  foo()
  boo()
  goo()
  doo()
}

/*SCAN
foo:platform
boo:platform
goo:platformB
doo:common
*/ 
