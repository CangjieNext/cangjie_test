// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-PIPE-1: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c 2>&1 | compare %f
package cmp

public abstract common class A {
    public abstract func foo(): Unit
    public common func foo2(): Unit
    public func foo3(): Unit
    public common abstract func foo4(): Unit
}

/* SCAN
error: 'common' abstract class function must have explicit 'common' or 'abstract' modifier
 ==> c/c.cj:7:17:
  | 
7 |     public func foo3(): Unit
  |                 ^^^^ 
  | 

1 error generated, 1 error printed.
*/