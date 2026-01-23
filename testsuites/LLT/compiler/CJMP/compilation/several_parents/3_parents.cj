// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//             COMMON
//           /  |    \
//          /   |     \
//         /    |      \
//  PARENT_1  PARENT_2  PARENT_3
//          \    |    /
//           \   |   /
//            \  |  /
//             CHILD

// NOTE:: COMMON PARENT
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir=c
package cmp

public common func foo() {
  println("common")
}

public func c() {
    foo()
}

// NOTE:PARENT 1
// SEPARATE-FILE: p1/p1.cj
// EXEC: %compiler %noColor --experimental p1/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p1
package cmp

public specific func foo() {
  println("p1")
}

public func p1() {
    foo()
}

// NOTE:PARENT 2
// SEPARATE-FILE: p2/p2.cj
// EXEC: %compiler %noColor --experimental p2/p2.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p2
package cmp

public specific func foo() {
  println("p2")
}

public func p2() {
    foo()
}

// NOTE:PARENT 3
// SEPARATE-FILE: p3/p3.cj
// EXEC: %compiler %noColor --experimental p3/p3.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p3
package cmp

public specific func foo() {
  println("p3")
}

public func p3() {
    foo()
}
// NOTE: DIAMOND CHILD
// SEPARATE-FILE: child/child.cj
// EXEC: %compiler %noColor --experimental child/child.cj p1/cmp.chir p2/cmp.chir p3/cmp.chir --common-part-cjo=p1/cmp.cjo --common-part-cjo=p2/cmp.cjo --common-part-cjo=p3/cmp.cjo --output-type=dylib
package cmp

public specific func foo() {
  println("child")
}

public func child() {
    foo()
}

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor --test main.cj -lcmp -L. -o %output
// RUN: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
   foo()
   c()
   p1()
   p2()
   p3()
   child()
}

/* SCAN
child
child
child
child
child
child
*/
