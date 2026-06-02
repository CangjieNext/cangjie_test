// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
package cmp
public abstract common class A{
    public common prop a: Int32
    public abstract prop b: Int32
    public common abstract prop c: Int32
    public prop d: Int32
    public init() {}
}

/* SCAN
error: 'common' abstract class property must have explicit 'common' or 'abstract' modifier
 ==> c/c.cj:7:17:
  | 
7 |     public prop d: Int32
  |                 ^ 
  | 

error: property must have accessors
 ==> c/c.cj:7:5:
  | 
7 |     public prop d: Int32
  |     ^^^^^^^^^^^^^^^^^^^^ 
  | 

2 errors generated, 2 errors printed.
*/