// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Same ICE as err_operator_call_empty_args.cj in another shape: the type A declares an explicit const
// init, while the call itself stays in a const func. The constant check then reports on the desugared
// call A() (a three character underline) rather than on A, so the diagnostic below differs from the
// one of the first case. The const init calling context is covered by err_operator_call_in_const_init.cj.

// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    const init() {}
    operator func ()(x: Array<A>) {}
}

const func foo() {
    A()()
}

main() {}

/* SCAN
error: expected 'const' expression
  ==> err_operator_call_type_has_const_init.cj:20:5:
   | 
20 |     A()()
   |     ^^^ 
   | 

1 error generated, 1 error printed.
*/
