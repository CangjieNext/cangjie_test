// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// NOTE: This test checks that initializers are correctly merged when it has to merge 2 parents source sets,
//       it checks that initialization order preserved correctly. Old initializers are removed.
//
//       COMMON
//         / \
//        /   \
//   PARENT_1  PARENT_2
//        \   /
//         \ /
//        CHILD


// NOTE: COMMON PARENT
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir=c
@NonProduct
features { }
package cmp

func foo() {
  println("foo")
  return 1
}

public common let a = foo()

// NOTE:PARENT 1
// SEPARATE-FILE: p1/p1.cj
// EXEC: %compiler %noColor --experimental p1/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p1
@NonProduct
features { p1 }
package cmp


// NOTE:PARENT 2
// SEPARATE-FILE: p2/p2.cj
// EXEC: %compiler %noColor --experimental p2/p2.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p2
@NonProduct
features { p2 }
package cmp

func foo2() {
  println("foo2")
  return 2
}

public specific let a = foo2()

// NOTE: DIAMOND CHILD
// SEPARATE-FILE: child/child.cj
// EXEC: %compiler %noColor --experimental child/child.cj p1/cmp.chir p2/cmp.chir --common-part-cjo=p1/cmp.cjo --common-part-cjo=p2/cmp.cjo --output-type=dylib
features { p1, p2 }
package cmp

public specific let a = 3

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor --test main.cj -lcmp -L. -o %output
// RUN: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  println(a)
}

/* SCAN
3
*/

