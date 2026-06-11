// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1:%frontendCompiler %typecheck %cmp_opt -Woff all %f 2>&1 | compare %f

// Guard for the issue #927 fix: a generic candidate whose generic params ARE
// fully determined by the matching member's parameter types (A<T> via
// `setx(x: T)`) must NOT be filtered from the sum constraint. The lambda stays
// ambiguous between A<T> and B exactly as before the fix. If A<T> were wrongly
// filtered out, the sum would collapse to {B}, the lambda would be inferred as
// (B) -> Int64 and this file would compile, breaking the expected diagnostic.

class A<T> {
    public func setx(x: T): Int64 { 1 }
}

class B {
    public func setx(x: Int64): Int64 { 2 }
}

main() {
    let f = {a => a.setx(42)}
    return 0
}

/* SCAN
error: parameters of this lambda expression must have type annotations
  ==> lambda_param_sum_keep_01.cj:25:14:
   | 
25 |     let f = {a => a.setx(42)}
   |              ^ 
   | 

1 error generated, 1 error printed.
*/
