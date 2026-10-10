// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Variant of the same ICE with another constant context: the call appears in the initializer of a
// global const variable instead of in a const func body. The check runs with a non-weak ChkExpr, so
// the diagnostic text differs from the one inside a const func.

// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    operator func ()(x: Array<A>) {}
}

const g = A()()

main() {}

/* SCAN
error: expected 'const' expression guaranteed to be evaluated at compile time
  ==> err_operator_call_global_const.cj:17:11:
   | 
17 | const g = A()()
   |           ^ 
   | 

1 error generated, 1 error printed.
*/
