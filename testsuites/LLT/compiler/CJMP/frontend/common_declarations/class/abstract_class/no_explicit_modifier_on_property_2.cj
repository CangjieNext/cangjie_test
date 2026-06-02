// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
package cmp
public abstract common class A{
    public common prop a: Int32 { get(){ 2 } }
    public abstract prop b: Int32 { get(){ 2 } } // error, `abstract` can have body
    public open prop c: Int32 { get(){ 2 } }  // ok, default function neither common nor abstract 
    public prop d: Int32 { get(){ 2 } } // ok, default function neither common nor abstract 
    public init() {}
}

/* SCAN
error: abstract property can not have body
 ==> c/c.cj:5:5:
  | 
5 |     public abstract prop b: Int32 { get(){ 2 } } // error, `abstract` can have body
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/