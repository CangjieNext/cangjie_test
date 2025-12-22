// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

public abstract common class A {
  public abstract common prop B: Int64
  init() {}
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib 2>&1 | compare %f
package cmp

public abstract platform class A {
    public platform prop B: Int64 { get() { 0 } }
}

/* SCAN
error: 'platform' property modifier is not match 'common' modifier
 ==> p/p.cj:5:5:
  | 
5 |     public platform prop B: Int64 { get() { 0 } }
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

error: 'common' property 'B' can not find 'platform' match
 ==> c/c.cj:9:3:

2 errors generated, 2 errors printed.
*/