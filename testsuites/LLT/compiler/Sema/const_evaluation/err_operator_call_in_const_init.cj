// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Calls A()() inside a const init body, the second constant context listed in the issue: the constant
// check runs over the constructor body and must report a non-constant expression instead of hitting
// the ICE on the desugared call.

// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    operator func ()(x: Array<A>) {}
}

struct B {
    const init() {
        A()()
    }
}

main() {}

/* SCAN
error: expected 'const' expression
  ==> err_operator_call_in_const_init.cj:19:9:
   | 
19 |         A()()
   |         ^ 
   | 

1 error generated, 1 error printed.
*/
