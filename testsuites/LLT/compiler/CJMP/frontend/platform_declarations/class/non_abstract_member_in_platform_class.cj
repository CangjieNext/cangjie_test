// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common abstract class A {} 
// SEPARATE-FILE: p/p.cj
// EXEC-PIPE-1: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p 2>&1 | compare %f
package cmp

platform abstract class A {
    init() {}
    abstract public func testFunc(): Unit
}

main() : Unit {}

/* SCAN
error: unexpected modifier 'abstract' on function declaration in class body
 ==> p/p.cj:6:5:
  | 
4 | platform abstract class A {
  |                   ~~~~~ in class
5 |     init() {}
6 |     abstract public func testFunc(): Unit
  |     ^^^^^^^^function declaration
  |     |
  |     unexpected modifier
  | 

1 error generated, 1 error printed.
*/
