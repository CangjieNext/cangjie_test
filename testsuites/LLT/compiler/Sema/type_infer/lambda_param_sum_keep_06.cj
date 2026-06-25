// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %diag_json %f -o %output 2>&1 | compare %f

// Guard for candidate filtering: a generic candidate may be determined by a
// member call's result type through outer constraints. `a[0]` does not cover
// Array<T>'s T from the subscript parameter types, but `== 1` constrains the
// result to Int64, so Array<Int64> must not be discarded.

main() {
    let f = {a => a[0] == 1} // a : Array<Int64> or String
    let _: (Array<Int64>) -> Bool = f
    return 0
}

// ASSERT: scan sema_lambdaExpr_must_have_type_annotation