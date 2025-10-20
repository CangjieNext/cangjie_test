// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
package cmp

public abstract common class A {
    init() {}
    public common open func foo(): Int64 { 1 }
    public common abstract func goo(): String
}

public class B <: A {} // `goo` is not implemented here

/* SCAN
error: class 'B' missing abstract modifier, otherwise abstract function or property should be implemented
  ==> c/c.cj:10:1:
   | 
10 | public class B <: A {} // `goo` is not implemented here
   | ^ 
   | 
note: unimplemented abstract function goo
 ==> c/c.cj:7:5:
  | 
7 |     public common abstract func goo(): String
  |     ^ 
  | 

1 error generated, 1 error printed.
*/