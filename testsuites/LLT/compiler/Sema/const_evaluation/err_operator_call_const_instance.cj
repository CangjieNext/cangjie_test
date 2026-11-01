// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Calls a const operator '()' on a const instance in a constant context: the base expression is constant,
// so the check continues to the synthesized empty Array argument and reports the diagnostic on that
// argument. That argument is positioned at the right parenthesis of the call, so the underline lands on
// the ')' alone; the check must report a non-constant expression instead of failing on a zero position.

// ERRCHECK: %compiler %cmp_opt %f -o %output

struct S {
    const init() {}
    const operator func ()(x: Array<S>) {}
}

const s = S()

const func foo() {
    s()
}

main() {}

/* SCAN
error: expected 'const' expression
  ==> err_operator_call_const_instance.cj:22:7:
   | 
22 |     s()
   |       ^ expressions of type 'Array' are not constant
   | 
   # note: consider add type annotation 'VArray<Struct-S, $0>' to use value array

1 error generated, 1 error printed.
*/
