// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Nested relative-common for top-level functions (function analogue of
// merging_initializers_nested_relative_common.cj):
//
//   p0  features { }
//    └─ p1  features { p1 }          ← specific f → relative common (WITH_DEFAULT)
//        ├─ p2  features { p1, p2 }  ← specific f again → deeper relative common
//        │    └─ child
//        └─ p3  features { p1, p3 }  ← does not touch f (still p1's relative common)
//             └─ child
//
// Child loads p2 + p3. Both CJO sides are COMMON_WITH_DEFAULT for `f`;
// AST must pick p2 because {p1,p2} ⊃ {p1} (not report overload conflict);
// CHIR must adopt the features-equal IR. Expect: a=1000, f()=1100.

// NOTE: p0
// SEPARATE-FILE: p0/p0.cj
// EXEC-0: %compiler %noColor --experimental p0/p0.cj --output-type=chir --output-dir=p0
@NonProduct
features { }
package cmp

public common let a = 1
public common func f() { a + 1 }

// NOTE: p1 — specific f becomes relative common for later stages
// SEPARATE-FILE: p1/p1.cj
// EXEC: %compiler %noColor --experimental p1/p1.cj --common-part-chir=p0/cmp.chir --common-part-cjo=./p0/cmp.cjo --output-type=chir --output-dir=p1
@NonProduct
features { p1 }
package cmp

public specific func f() { a + 10 }

// NOTE: p2 — deeper specific f
// SEPARATE-FILE: p2/p2.cj
// EXEC: %compiler %noColor --experimental p2/p2.cj --common-part-chir=p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=chir --output-dir=p2
@NonProduct
features { p1, p2 }
package cmp

public specific func f() { a + 100 }

// NOTE: p3 — transmits p1's relative common f unchanged
// SEPARATE-FILE: p3/p3.cj
// EXEC: %compiler %noColor --experimental p3/p3.cj --common-part-chir=p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=chir --output-dir=p3
@NonProduct
features { p1, p3 }
package cmp

// NOTE: child — merge p2 + p3; specific a covers relative commons
// SEPARATE-FILE: child/child.cj
// EXEC: %compiler %noColor --experimental child/child.cj --common-part-chir=p2/cmp.chir --common-part-chir=p3/cmp.chir --common-part-cjo=p2/cmp.cjo --common-part-cjo=p3/cmp.cjo --output-type=dylib
features { p1, p2, p3 }
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
  println(f())
}

/* SCAN
1000
1100
*/
