// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// NOTE: This test checks that initializers are correctly merged when it has to merge 2 parents source sets,
//       it checks that initialization order preserved correctly.
//
//       COMMON
//         / \
//        /   \
//   PARENT_1  PARENT_2
//        \   /
//         \ /
//        CHILD


// NOTE:: COMMON PARENT
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir=c
package cmp

public common let a = 1
public common let b = a + 1
public common let c = a + 1
public common let d = a + 1

// NOTE:PARENT 1
// SEPARATE-FILE: p1/p1.cj
// EXEC: %compiler %noColor --experimental p1/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p1
package cmp

public specific let b = a + 10

// NOTE:PARENT 2
// SEPARATE-FILE: p2/p2.cj
// EXEC: %compiler %noColor --experimental p2/p2.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p2
package cmp

public specific let c = b + 100

// NOTE: DIAMOND CHILD
// SEPARATE-FILE: child/child.cj
// EXEC: %compiler %noColor --experimental child/child.cj p1/cmp.chir p2/cmp.chir --common-part-cjo=p1/cmp.cjo --common-part-cjo=p2/cmp.cjo --output-type=dylib
package cmp

public specific let d = c + 1000

// SEPARATE-FILE: main.cj
// EXEC: %compiler %noColor --test main.cj -lcmp -L. -o %output
// RUN: %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  println(a)
  println(b)
  println(c)
  println(d)
}

/* SCAN
1
11
111
1111
*/
