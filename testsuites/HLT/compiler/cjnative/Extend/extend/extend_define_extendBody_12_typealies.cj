/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

interface I {} 

class A <: I{
	var a = 2
}

type C = Int64
extend C { 
  /* TODO: non static generic type function not supported
  func f<T>(a: T, b!: Int64 = 0) where T <: I {
    return 1
  } */
  private func f(a: String, b: String) {
    return 2
  } 
}



main(): Int64{
  return /*1.f<A>(A()) + */ 1.f("", "") - 3;  
}



 1.f("", "") - 3;  
   |                               ^ 
   | 

1 error generated, 1 error printed.
*/
 1.f("", "") - 3;  
   |                               ^ 
   | 

1 error generated, 1 error printed.
*/
// ASSERT: scan parse_expected_decl
