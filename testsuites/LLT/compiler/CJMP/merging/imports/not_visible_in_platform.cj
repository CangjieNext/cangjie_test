// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

import std.unittest.*
import std.unittest.testmacro.*

@UnittestOption[Int](qwe)

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

public func foo() {
    let c = Configuration()
    c.set(KeyQwe.qwe, 42)

    println(c)
}

/* SCAN
error: undeclared identifier 'Configuration'
 ==> p/p.cj:9:13:
  | 
9 |     let c = Configuration()
  |             ^ 
  | 

1 error generated, 1 error printed.
*/

// SEPARATE-FILE: p/p1.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p1.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

@UnittestOption[Int](zxc)

/* SCAN
error: undeclared identifier 'UnittestOption'
 ==> p/p1.cj:4:1:
  | 
4 | @UnittestOption[Int](zxc)
  | ^ 
  | 

1 error generated, 1 error printed.
*/
