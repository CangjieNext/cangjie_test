// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1:%frontendCompiler %typecheck %cmp_opt -Woff all %f 2>&1 | compare %f

// Guard for the issue #927 fix: when the matching member is declared in an
// EXTEND of the generic type (extend<T> W<T> { h(x: T) }), the coverage of the
// extend's T must be mapped through the extended type's args so that W<T> is
// recognized as determinable and kept in the sum. If the extend walk were
// broken, W would be wrongly filtered, the sum would collapse to {U} and this
// file would compile, breaking the expected diagnostic.

class W<T> {}

extend<T> W<T> {
    public func h(x: T): Int64 { 0 }
}

class U {
    public func h(x: Int64): Int64 { 1 }
}

main() {
    let f = {w => w.h(1)}
    return 0
}

/* SCAN
error: parameters of this lambda expression must have type annotations
  ==> lambda_param_sum_keep_03.cj:27:14:
   | 
27 |     let f = {w => w.h(1)}
   |              ^ 
   | 

1 error generated, 1 error printed.
*/
