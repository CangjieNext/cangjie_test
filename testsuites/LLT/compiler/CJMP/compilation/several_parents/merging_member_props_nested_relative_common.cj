// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Nested relative-common for class member properties (getter + setter;
// property analogue of merging_member_funcs_nested_relative_common.cj):
//
//   p0  features { }
//    └─ p1  features { p1 }          ← specific A.p / A.q → relative common
//        ├─ p2  features { p1, p2 }  ← specific again → deeper relative common
//        │    └─ child
//        └─ p3  features { p1, p3 }  ← does not touch A.p / A.q
//             └─ child
//
// Child loads p2 + p3. Expect:
//   a = 1000
//   A().p = 1100              (getter body from {p1,p2})
//   after x.q = 0: x.q = 1100 (setter body from {p1,p2}: s = v + a + 100)

// NOTE: p0
// SEPARATE-FILE: p0/p0.cj
// EXEC-0: %compiler %noColor --experimental p0/p0.cj --output-type=chir --output-dir=p0
@NonProduct
features { }
package cmp

public common let a = 1
public common var s = 0

public common class A {
  public init() {}
  public common prop p: Int64 {
    get() { a + 1 }
  }
  public common mut prop q: Int64 {
    get() { s }
    set(v) { s = v + a }
  }
}

// NOTE: p1
// SEPARATE-FILE: p1/p1.cj
// EXEC: %compiler %noColor --experimental p1/p1.cj --common-part-chir=p0/cmp.chir --common-part-cjo=./p0/cmp.cjo --output-type=chir --output-dir=p1
@NonProduct
features { p1 }
package cmp

public specific class A {
  public specific prop p: Int64 {
    get() { a + 10 }
  }
  public specific mut prop q: Int64 {
    get() { s }
    set(v) { s = v + a + 10 }
  }
}

// NOTE: p2
// SEPARATE-FILE: p2/p2.cj
// EXEC: %compiler %noColor --experimental p2/p2.cj --common-part-chir=p1/cmp.chir --common-part-cjo=./p1/cmp.cjo --output-type=chir --output-dir=p2
@NonProduct
features { p1, p2 }
package cmp

public specific class A {
  public specific prop p: Int64 {
    get() { a + 100 }
  }
  public specific mut prop q: Int64 {
    get() { s }
    set(v) { s = v + a + 100 }
  }
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
  let x = A()
  println(x.p)
  x.q = 0
  println(x.q)
}

/* SCAN
1000
1100
1100
*/
