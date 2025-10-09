// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
package cmp

public common abstract class A {
    public common func a(): Int{0}
    public abstract func b(): Int{0} // error, abstract can't have body
    public common abstract func c(): Int{0} // error, abstract can't have body
    public func d(): Int {0} // it has body, so it's simple function, neither common nor abstract
}

/* SCAN
error: abstract function can not have body
 ==> c/c.cj:6:5:
  | 
6 |     public abstract func b(): Int{0} // error, abstract can't have body
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

error: abstract function can not have body
 ==> c/c.cj:7:5:
  | 
7 |     public common abstract func c(): Int{0} // error, abstract can't have body
  |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

2 errors generated, 2 errors printed.
*/
