// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

@C
struct A {
	public static let a: A = A()
}

foreign func foo(pa: CPointer<A>): Unit

main() {
	var s = A()
    unsafe {foo(inout s)}
    0
}

/* SCAN
error: the expression qualified by 'inout' cannot be of zero-sized type
  ==> inout_zero_size.cj:12:17:
   | 
12 |     unsafe {foo(inout s)}
   |                 ^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
