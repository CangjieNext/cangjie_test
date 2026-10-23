// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// NOTE: Diamond multi-parent (§1.3 of global-var merge design).
//
//       COMMON  features { }
//         /              \
//   PARENT_1 {p1}    PARENT_2 {p2}   ← specific → relative common
//         \              /
//          CHILD { p1, p2 }          ← specific a covers relative common


// NOTE: COMMON PARENT
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir=c
@NonProduct
features { }
package cmp

public common let a = 1
public common let b = a + 1

// NOTE:PARENT 1
// SEPARATE-FILE: p1/p1.cj
// EXEC: %compiler %noColor --experimental p1/p1.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p1
@NonProduct
features { p1 }
package cmp

public specific let b = a + 10

// NOTE:PARENT 2
// SEPARATE-FILE: p2/p2.cj
// EXEC: %compiler %noColor --experimental p2/p2.cj --common-part-chir=c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=chir --output-dir=p2
@NonProduct
features { p2 }
package cmp

public specific let a = 100

// NOTE: DIAMOND CHILD
// SEPARATE-FILE: child/child.cj
// EXEC: %compiler %noColor --experimental child/child.cj --common-part-chir=p1/cmp.chir --common-part-chir=p2/cmp.chir --common-part-cjo=p1/cmp.cjo --common-part-cjo=p2/cmp.cjo --output-type=dylib
features { p1, p2 }
package cmp

public specific let a = 1000

// SEPARATE-FILE: main.cj
// EXEC-0: %compiler %noColor main.cj --import-path=. -L. -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:. %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=.;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:. %run %output 2>&1 | compare %f
import cmp.*

main(): Unit {
  println(a)
  println(b)
}

/* SCAN
1000
1010
*/
