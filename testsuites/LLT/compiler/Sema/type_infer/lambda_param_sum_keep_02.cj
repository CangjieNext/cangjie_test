// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1:%frontendCompiler %typecheck %cmp_opt -Woff all %f 2>&1 | compare %f

// Guard for the issue #927 fix: when the matching member is INHERITED from a
// generic super class (D1<T> <: Base<T>, `g(x: T)` declared in Base), the
// coverage of Base's T must be mapped back through the inherited type's args
// so that D1<T> is recognized as determinable and kept in the sum. If the
// inheritance walk were broken, D1/Base would be wrongly filtered, the sum
// would collapse to {D2} and this file would compile, breaking the diagnostic.

open class Base<T> {
    public func g(x: T): Int64 { 0 }
}

class D1<T> <: Base<T> {}

class D2 {
    public func g(x: Int64): Int64 { 1 }
}

main() {
    let f = {d => d.g(1)}
    return 0
}

/* SCAN
error: parameters of this lambda expression must have type annotations
  ==> lambda_param_sum_keep_02.cj:27:14:
   | 
27 |     let f = {d => d.g(1)}
   |              ^ 
   | 

1 error generated, 1 error printed.
*/
