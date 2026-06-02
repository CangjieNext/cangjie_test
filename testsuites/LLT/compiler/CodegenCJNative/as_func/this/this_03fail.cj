// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f

open class A {
    public init(x: Int64) {
        this()
    }
    public operator func ()(): Unit {}
    public func foo() {
        this()
    }
}

class B <: A {
    public init() {
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
  ==> this_03fail.cj:11:13:
   | 
11 |         this()
   |             ^^ expected 1 argument, found 0
   | 
note: found candidate
  ==> this_03fail.cj:10:12:
   | 
10 |     public init(x: Int64) {
   |            ^^^^ 
   | 

error: invalid calling 'this' outside the constructor
  ==> this_03fail.cj:15:9:
   | 
15 |         this()
   |         ^ 
   | 

error: missing argument for parameter list '(Int64)' in call
  ==> this_03fail.cj:21:14:
   | 
21 |         super()
   |              ^^ expected 1 argument, found 0
   | 
note: found candidate
  ==> this_03fail.cj:10:12:
   | 
10 |     public init(x: Int64) {
   |            ^^^^ 
   | 

3 errors generated, 3 errors printed.
*/
