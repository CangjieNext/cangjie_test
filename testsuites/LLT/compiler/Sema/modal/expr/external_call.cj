// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output -Woff all 2>&1 | compare %f

class F {}
func foo(a: F@local!) {
    a 
}

func bar(a: F@local!): F@local! {
    foo(a)
}
func baz(a: F@local!): F@local! {
    let g = foo
    g(a)
}

main() {}

/* SCAN
error: cannot return expression of internal @local! mode
  ==> external_call.cj:15:5:
   | 
15 |     foo(a)
   |     ^^^^^^ 
   | 

error: cannot pass argument of external @local! to @local! parameter 'a'
  ==> external_call.cj:15:9:
   | 
15 |     foo(a)
   |         ^ 
   | 

error: cannot return expression of internal @local! mode
  ==> external_call.cj:19:5:
   | 
19 |     g(a)
   |     ^^^^ 
   | 

error: cannot pass argument of external @local! to @local! parameter ''
  ==> external_call.cj:19:7:
   | 
19 |     g(a)
   |       ^ 
   | 

4 errors generated, 4 errors printed.
*/
