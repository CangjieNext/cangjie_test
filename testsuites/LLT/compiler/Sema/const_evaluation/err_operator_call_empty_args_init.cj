// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Same ICE as err_operator_call_empty_args.cj in another shape: the type declares an explicit const
// init. The constant check then reports on the desugared call A() (a three character underline) rather
// than on A, so the diagnostic expected below differs from the one of the first case.

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
  ==> err_operator_call_empty_args_init.cj:19:5:
   | 
19 |     A()()
   |     ^^^ 
   | 

1 error generated, 1 error printed.
*/
