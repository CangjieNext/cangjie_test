// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common abstract class A {
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

platform abstract class A {
    init() {}
    abstract public prop testProp: Int
}

main() : Unit {

}

/* SCAN
error: platform abstract class 'A' cannot have non-platform abstract property
 ==> p/p.cj:6:5:
  | 
6 |     abstract public prop testProp: Int
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
