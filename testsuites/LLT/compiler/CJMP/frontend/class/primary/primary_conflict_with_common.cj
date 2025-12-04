// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
package cmp

public  common class A {
    public common A() {
    }
}

/* SCAN
error: unexpected modifier 'common' on primary constructor
 ==> c/c.cj:5:12:
  | 
4 | public  common class A {
  |                ~~~~~ in class
5 |     public common A() {
  |            ^^^^^^ ~ on primary constructor
  |            |
  |            unexpected modifier
  | 

1 error generated, 1 error printed.
*/
