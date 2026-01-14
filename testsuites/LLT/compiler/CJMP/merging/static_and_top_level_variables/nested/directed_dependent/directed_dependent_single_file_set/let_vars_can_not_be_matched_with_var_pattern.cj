// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public common let A1: Int = 1
public common let A2: Int = 2

public common var B1: Int = 1
public common var B2: Int = 2


// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

public specific var (A1, A2): (Int64, Int64) = (1, 1)
public specific let (B1, B2): (Int64, Int64) = (1, 1)

/* SCAN
error: 'specific' 'var' can not match 'common' 'let'
 ==> p/p.cj:4:22:
  | 
4 | public specific var (A1, A2): (Int64, Int64) = (1, 1)
  |                      ^^ 
  | 

error: 'specific' 'var' can not match 'common' 'let'
 ==> p/p.cj:4:26:
  | 
4 | public specific var (A1, A2): (Int64, Int64) = (1, 1)
  |                          ^^ 
  | 

error: 'specific' 'let' can not match 'common' 'var'
 ==> p/p.cj:5:22:
  | 
5 | public specific let (B1, B2): (Int64, Int64) = (1, 1)
  |                      ^^ 
  | 

error: 'specific' 'let' can not match 'common' 'var'
 ==> p/p.cj:5:26:
  | 
5 | public specific let (B1, B2): (Int64, Int64) = (1, 1)
  |                          ^^ 
  | 

4 errors generated, 4 errors printed.
*/
