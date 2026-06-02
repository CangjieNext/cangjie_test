// EXEC-PIPE-1: %compiler %ulimit-error %noColor %f -o %output 2>&1 | compare %f

public foreign func foo1(): Unit
protected foreign func foo2(): Unit
internal foreign func foo3(): Unit
private foreign func foo4(): Unit

foreign public func foo5(): Unit
foreign protected func foo6(): Unit
foreign internal func foo7(): Unit
foreign private func foo8(): Unit

unsafe main() {
    foo1()
    foo2()
    foo3()
    foo4()
}

/* SCAN
error: 'foreign' and 'public' modifiers conflict on function declaration
 ==> foreign00804.cj:3:8:
  | 
3 | public foreign func foo1(): Unit
  | ~~~~~~ ^^^^^^^ ~~~~ on function declaration
  | |      |
  | |      unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'foreign' and 'protected' modifiers conflict on function declaration
 ==> foreign00804.cj:4:11:
  | 
4 | protected foreign func foo2(): Unit
  | ~~~~~~~~~ ^^^^^^^ ~~~~ on function declaration
  | |         |
  | |         unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'foreign' and 'internal' modifiers conflict on function declaration
 ==> foreign00804.cj:5:10:
  | 
5 | internal foreign func foo3(): Unit
  | ~~~~~~~~ ^^^^^^^ ~~~~ on function declaration
  | |        |
  | |        unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'foreign' and 'private' modifiers conflict on function declaration
 ==> foreign00804.cj:6:9:
  | 
6 | private foreign func foo4(): Unit
  | ~~~~~~~ ^^^^^^^ ~~~~ on function declaration
  | |       |
  | |       unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'public' and 'foreign' modifiers conflict on function declaration
 ==> foreign00804.cj:8:9:
  | 
8 | foreign public func foo5(): Unit
  | ~~~~~~~ ^^^^^^ ~~~~ on function declaration
  | |       |
  | |       unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'protected' and 'foreign' modifiers conflict on function declaration
 ==> foreign00804.cj:9:9:
  | 
9 | foreign protected func foo6(): Unit
  | ~~~~~~~ ^^^^^^^^^ ~~~~ on function declaration
  | |       |
  | |       unexpected modifier
  | |
  | because it is conflicted with this
  | 

error: 'internal' and 'foreign' modifiers conflict on function declaration
  ==> foreign00804.cj:10:9:
   | 
10 | foreign internal func foo7(): Unit
   | ~~~~~~~ ^^^^^^^^ ~~~~ on function declaration
   | |       |
   | |       unexpected modifier
   | |
   | because it is conflicted with this
   | 

error: 'private' and 'foreign' modifiers conflict on function declaration
  ==> foreign00804.cj:11:9:
   | 
11 | foreign private func foo8(): Unit
   | ~~~~~~~ ^^^^^^^ ~~~~ on function declaration
   | |       |
   | |       unexpected modifier
   | |
   | because it is conflicted with this
   | 

8 errors generated, 8 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
