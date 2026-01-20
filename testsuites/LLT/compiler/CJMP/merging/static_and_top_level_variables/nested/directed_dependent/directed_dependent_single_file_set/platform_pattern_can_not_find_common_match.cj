// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

public specific let (X1, X2): (Int64, Int64) = (1, 2)

/* SCAN
error: 'specific' variable 'X1' can not find 'common' match
 ==> p/p.cj:4:22:
  | 
4 | public specific let (X1, X2): (Int64, Int64) = (1, 2)
  |                      ^^ 
  | 

error: 'specific' variable 'X2' can not find 'common' match
 ==> p/p.cj:4:26:
  | 
4 | public specific let (X1, X2): (Int64, Int64) = (1, 2)
  |                          ^^ 
  | 

error: 'specific' variable with pattern can not find 'common' match
 ==> p/p.cj:4:1:
  | 
4 | public specific let (X1, X2): (Int64, Int64) = (1, 2)
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

3 errors generated, 3 errors printed.
*/
