// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// NOTE: Merge two parents' initializers (true diamond + feature headers).
//
//       COMMON  features { }
//         /              \
//   PARENT_1 {p1}    PARENT_2 {p2}
//         \              /
//          CHILD { p1, p2 }
//
// Sibling parents have incomparable feature sets; same-tier relative commons that
// both carry WITH_DEFAULT cannot be ranked by strict superset. Vars that must
// win over a sibling transmission are covered by child specific (y, z).


// NOTE:: COMMON PARENT
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir=c
@NonProduct
features { }
package cmp

public let a = 1
public common let x = 10
public let b = 2
public common let y = 20
public common let z = 30

// NOTE:PARENT 1
// SEPARATE-FILE: p1/p1.cj
// EXEC: %compiler %noColor --experimental p1/p1.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p1
@NonProduct
features { p1 }
package cmp

public let c = 3
public specific let y = 201

// NOTE:PARENT 2
// SEPARATE-FILE: p2/p2.cj
// EXEC: %compiler %noColor --experimental p2/p2.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p2
@NonProduct
features { p2 }
package cmp

public specific let z = 302
public specific let y = 202
public let d = 4

// NOTE: DIAMOND CHILD
// SEPARATE-FILE: child/child.cj
// EXEC: %compiler %noColor --experimental child/child.cj --common-part-chir=p1/cmp.chir --common-part-chir=p2/cmp.chir --common-part-cjo=p1/cmp.cjo --common-part-cjo=p2/cmp.cjo --output-type=dylib
features { p1, p2 }
package cmp

public specific let y = 2000
public specific let z = 302

// SEPARATE-FILE: main.cj
// EXEC-0: %compiler %noColor main.cj --import-path=. -L. -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:. %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=.;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:. %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  println(a)
  println(b)
  println(c)
  println(d)

  println(x)
  println(y)
  println(z)
}

/* SCAN
1
2
3
4
10
2000
302
*/
