// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Guards the ICE when a constant context calls operator '()' on an instance whose only parameter is an
// Array type and no argument is passed. The call is first desugared into a member access call and then
// desugared again as a possibly variadic call, which moves the baseFunc of the intermediate CallExpr out
// and leaves that CallExpr in the AST. ConstEvaluationChecker walked its desugarExpr and asserted that
// baseFunc is not null; the call must be reported as a non-constant expression instead.

// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    operator func ()(x: Array<A>) {}
}

const func foo() {
    A()()
}

main() {}

/* SCAN
error: expected 'const' expression
  ==> err_operator_call_empty_args.cj:20:5:
   | 
20 |     A()()
   |     ^ 
   | 

1 error generated, 1 error printed.
*/
