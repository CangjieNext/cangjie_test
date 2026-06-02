// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

@C
struct A {
	public let a: A = A()
}

foreign func foo(pa: CPointer<A>): Unit

main() {
	var s = A()
    unsafe {foo(inout s)}
    0
}

/* SCAN
error: recursive constructor calling detected
 ==> inout_zero_size2.cj:5:20:
  | 
5 |     public let a: A = A()
  |                       ^ 
  | 
note: depends on
 ==> inout_zero_size2.cj:4:8:
  | 
4 | struct A {
  |        ^ 
  | 
note: depends on
 ==> inout_zero_size2.cj:5:20:
  | 
5 |     public let a: A = A()
  |                       ^ 
  | 

error: value type recursive detected: 'A->A'
 ==> inout_zero_size2.cj:4:1:
  | 
4 | struct A {
  | ^ 
  | 

2 errors generated, 2 errors printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
