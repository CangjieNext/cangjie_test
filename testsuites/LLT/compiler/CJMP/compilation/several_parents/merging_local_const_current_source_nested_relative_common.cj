// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Product-stage specific `f` redefines lifted local const / const func under a
// multi-parent merge. Parent chir still carries p2's k=100; child must not keep
// that IR — AST→CHIR from current-source f (k=1000) must win.
// Expect: a=1000, f()=2000.

// NOTE: p0
// SEPARATE-FILE: p0/p0.cj
// EXEC-0: %compiler %noColor --experimental p0/p0.cj --output-type=chir --output-dir=p0
@NonProduct
features { }
package cmp

public common let a = 1
public common func f() {
  const k = 1
  const func g() { k }
  g() + a
}

// NOTE: p1
// SEPARATE-FILE: p1/p1.cj
// EXEC: %compiler %noColor --experimental p1/p1.cj --common-part-chir=p0/cmp.chir --common-part-cjo=./p0/cmp.cjo --output-type=chir --output-dir=p1
@NonProduct
features { p1 }
package cmp

public specific func f() {
  const k = 10
  const func g() { k }
  g() + a
}

// NOTE: p2
// SEPARATE-FILE: p2/p2.cj
// EXEC: %compiler %noColor --experimental p2/p2.cj --common-part-chir=p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=chir --output-dir=p2
@NonProduct
features { p1, p2 }
package cmp

public specific func f() {
  const k = 100
  const func g() { k }
  g() + a
}

// NOTE: p3
// SEPARATE-FILE: p3/p3.cj
// EXEC: %compiler %noColor --experimental p3/p3.cj --common-part-chir=p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=chir --output-dir=p3
@NonProduct
features { p1, p3 }
package cmp

// NOTE: child — current-source specific f (and a); lifted k/g must follow child
// SEPARATE-FILE: child/child.cj
// EXEC: %compiler %noColor --experimental child/child.cj --common-part-chir=p2/cmp.chir --common-part-chir=p3/cmp.chir --common-part-cjo=p2/cmp.cjo --common-part-cjo=p3/cmp.cjo --output-type=dylib
features { p1, p2, p3 }
package cmp

public specific let a = 1000
public specific func f() {
  const k = 1000
  const func g() { k }
  g() + a
}

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
2000
*/
