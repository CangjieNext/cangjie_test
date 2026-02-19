// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common func testFunc1(x!: Int64 = 10, y!: String = "common"): String

common class A{
  public common func testFunc2(a: Int64, b!: Float64 = 3.14): Float64; init() {}
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f

package cmp

public specific func testFunc1(x!: Int64 = 20, y!: String = "specific"): String {"a"}

specific class A{
  public specific func testFunc2(a: Int64, b!: Float64 = 2.71): Float64 {1.0}
}

/* SCAN
error: parameter default value should be on either 'common' or 'specific' side, not both
 ==> p/p.cj:5:32:
  | 
5 | public specific func testFunc1(x!: Int64 = 20, y!: String = "specific"): String {"a"}
  |                                ^^^^^^^^^^^^^^ 
  | 

error: 'specific' function 'testFunc1' can not find 'common' match
 ==> p/p.cj:5:1:
  | 
5 | public specific func testFunc1(x!: Int64 = 20, y!: String = "specific"): String {"a"}
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

error: parameter default value should be on either 'common' or 'specific' side, not both
 ==> p/p.cj:8:44:
  | 
8 |   public specific func testFunc2(a: Int64, b!: Float64 = 2.71): Float64 {1.0}
  |                                            ^^^^^^^^^^^^^^^^^^ 
  | 

error: 'specific' function 'testFunc2' can not find 'common' match
 ==> p/p.cj:8:3:
  | 
8 |   public specific func testFunc2(a: Int64, b!: Float64 = 2.71): Float64 {1.0}
  |   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

error: 'common' function 'testFunc2' can not find 'specific' match
  ==> c/c.cj:13:3:

error: 'common' function 'testFunc1' can not find 'specific' match
 ==> c/c.cj:7:1:

6 errors generated, 6 errors printed.
*/
