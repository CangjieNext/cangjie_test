// EXEC-PIPE-1: %compiler %ulimit-error %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output 2>&1 | compare %f

public foreign func foo0(): Unit
foreign public func foo1(): Unit

protected foreign func foo2(): Unit
foreign protected func foo3(): Unit

private foreign func foo4(): Unit
foreign private func foo5(): Unit

open foreign func foo6(): Unit
foreign open func foo7(): Unit

override foreign func foo8(): Unit
foreign override func foo9(): Unit

static foreign func foo10(): Unit
foreign static func foo11(): Unit

redef foreign func foo12(): Unit
foreign redef func foo13(): Unit

mut foreign func foo14(): Unit
foreign mut func foo15(): Unit

main() {}

/* SCAN-IN
error: 'foreign' and 'public' modifiers conflict on function declaration
 ==> foreign00801.cj:3:8:
  | 
3 | public foreign func foo0(): Unit
  | ~~~~~~ ^^^^^^^ ~~~~ on function declaration
  | |      |
  | |      unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'public' and 'foreign' modifiers conflict on function declaration
 ==> foreign00801.cj:4:9:
  | 
4 | foreign public func foo1(): Unit
  | ~~~~~~~ ^^^^^^ ~~~~ on function declaration
  | |       |
  | |       unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'foreign' and 'protected' modifiers conflict on function declaration
 ==> foreign00801.cj:6:11:
  | 
6 | protected foreign func foo2(): Unit
  | ~~~~~~~~~ ^^^^^^^ ~~~~ on function declaration
  | |         |
  | |         unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'protected' and 'foreign' modifiers conflict on function declaration
 ==> foreign00801.cj:7:9:
  | 
7 | foreign protected func foo3(): Unit
  | ~~~~~~~ ^^^^^^^^^ ~~~~ on function declaration
  | |       |
  | |       unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'foreign' and 'private' modifiers conflict on function declaration
 ==> foreign00801.cj:9:9:
  | 
9 | private foreign func foo4(): Unit
  | ~~~~~~~ ^^^^^^^ ~~~~ on function declaration
  | |       |
  | |       unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'private' and 'foreign' modifiers conflict on function declaration
  ==> foreign00801.cj:10:9:
   | 
10 | foreign private func foo5(): Unit
   | ~~~~~~~ ^^^^^^^ ~~~~ on function declaration
   | |       |
   | |       unexpected modifier
   | |
   | because it is conflicted with this
   | 

error: unexpected modifier 'open' on function declaration in 'top-level' scope
  ==> foreign00801.cj:12:1:
   | 
12 | open foreign func foo6(): Unit
   | ^^^^         ~~~~ on function declaration in 'top-level' scope
   | |
   | unexpected modifier
   | 

error: unexpected modifier 'open' on function declaration in 'top-level' scope
  ==> foreign00801.cj:13:9:
   | 
13 | foreign open func foo7(): Unit
   |         ^^^^ ~~~~ on function declaration in 'top-level' scope
   |         |
   |         unexpected modifier
   | 

error: unexpected modifier 'override' on function declaration in 'top-level' scope
  ==> foreign00801.cj:15:1:
   | 
15 | override foreign func foo8(): Unit
   | ^^^^^^^^         ~~~~ on function declaration in 'top-level' scope
   | |
   | unexpected modifier
   | 

error: unexpected modifier 'override' on function declaration in 'top-level' scope
  ==> foreign00801.cj:16:9:
   | 
16 | foreign override func foo9(): Unit
   |         ^^^^^^^^ ~~~~ on function declaration in 'top-level' scope
   |         |
   |         unexpected modifier
   | 

error: unexpected modifier 'static' on function declaration in 'top-level' scope
  ==> foreign00801.cj:18:1:
   | 
18 | static foreign func foo10(): Unit
   | ^^^^^^         ~~~~ on function declaration in 'top-level' scope
   | |
   | unexpected modifier
   | 

error: unexpected modifier 'static' on function declaration in 'top-level' scope
  ==> foreign00801.cj:19:9:
   | 
19 | foreign static func foo11(): Unit
   |         ^^^^^^ ~~~~ on function declaration in 'top-level' scope
   |         |
   |         unexpected modifier
   | 

error: unexpected modifier 'redef' on function declaration in 'top-level' scope
  ==> foreign00801.cj:21:1:
   | 
21 | redef foreign func foo12(): Unit
   | ^^^^^         ~~~~ on function declaration in 'top-level' scope
   | |
   | unexpected modifier
   | 

error: unexpected modifier 'redef' on function declaration in 'top-level' scope
  ==> foreign00801.cj:22:9:
   | 
22 | foreign redef func foo13(): Unit
   |         ^^^^^ ~~~~ on function declaration in 'top-level' scope
   |         |
   |         unexpected modifier
   | 

error: unexpected modifier 'mut' on function declaration in 'top-level' scope
  ==> foreign00801.cj:24:1:
   | 
24 | mut foreign func foo14(): Unit
   | ^^^         ~~~~ on function declaration in 'top-level' scope
   | |
   | unexpected modifier
   | 

error: unexpected modifier 'mut' on function declaration in 'top-level' scope
  ==> foreign00801.cj:25:9:
   | 
25 | foreign mut func foo15(): Unit
   |         ^^^ ~~~~ on function declaration in 'top-level' scope
   |         |
   |         unexpected modifier
   | 

16 errors generated, 16 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
