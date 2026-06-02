// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix 2>&1 | compare %f

open class A {
    init(x: Int64) {
        this()
    }
    operator func ()(): Unit {}
    func foo() {
        this()
    }
}

class B <: A {
    init() {
        super()
    }
    func goo() {
        super()
    }
}

main() {
    let a = A(1)
    a()
    1
}

/* SCAN
error: missing argument for parameter list '(Int64)' in call
  ==> this_04fail.cj:11:13:
   | 
11 |         this()
   |             ^^ expected 1 argument, found 0
   | 
note: found candidate
  ==> this_04fail.cj:10:5:
   | 
10 |     init(x: Int64) {
   |     ^^^^ 
   | 

error: invalid calling 'this' outside the constructor
  ==> this_04fail.cj:15:9:
   | 
15 |         this()
   |         ^ 
   | 

error: missing argument for parameter list '(Int64)' in call
  ==> this_04fail.cj:21:14:
   | 
21 |         super()
   |              ^^ expected 1 argument, found 0
   | 
note: found candidate
  ==> this_04fail.cj:10:5:
   | 
10 |     init(x: Int64) {
   |     ^^^^ 
   | 

error: invalid calling 'super' outside the constructor
  ==> this_04fail.cj:24:9:
   | 
24 |         super()
   |         ^ 
   | 

4 errors generated, 4 errors printed.
*/
