// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Nested relative-common for static member VarDecl (→ CHIR GlobalVar).
// Initializer uses a literal (not `a`) so file-init order across parents does not
// affect the observed value; merge still picks {p1,p2}'s body.
// Expect: a=1000, A.b=100.

// NOTE: p0
// SEPARATE-FILE: p0/p0.cj
// EXEC-0: %compiler %noColor --experimental p0/p0.cj --output-type=chir --output-dir=p0
@NonProduct
features { }
package cmp

public common let a = 1

public common class A {
  public init() {}
  public common static let b = 1
}

// NOTE: p1
// SEPARATE-FILE: p1/p1.cj
// EXEC: %compiler %noColor --experimental p1/p1.cj --common-part-chir=p0/cmp.chir --common-part-cjo=./p0/cmp.cjo --output-type=chir --output-dir=p1
@NonProduct
features { p1 }
package cmp

public specific class A {
  public specific static let b = 10
}

// NOTE: p2
// SEPARATE-FILE: p2/p2.cj
// EXEC: %compiler %noColor --experimental p2/p2.cj --common-part-chir=p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=chir --output-dir=p2
@NonProduct
features { p1, p2 }
package cmp

public specific class A {
  public specific static let b = 100
}

// NOTE: p3
// SEPARATE-FILE: p3/p3.cj
// EXEC: %compiler %noColor --experimental p3/p3.cj --common-part-chir=p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=chir --output-dir=p3
@NonProduct
features { p1, p3 }
package cmp

// NOTE: child
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
  println(A.b)
}

/* SCAN
1000
100
*/
