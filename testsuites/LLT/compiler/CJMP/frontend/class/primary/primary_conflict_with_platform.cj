// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


public  common class A {
    public A() {
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor  --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp


public platform class A {
    public platform A() {
    }
}

/* SCAN
error: unexpected modifier 'platform' on primary constructor
 ==> p/p.cj:6:12:
  | 
5 | public platform class A {
  |                 ~~~~~ in class
6 |     public platform A() {
  |            ^^^^^^^^ ~ on primary constructor
  |            |
  |            unexpected modifier
  | 

1 error generated, 1 error printed.
*/
