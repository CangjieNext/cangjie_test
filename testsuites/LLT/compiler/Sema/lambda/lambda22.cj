// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

struct A {
    public func foo(a: Float64) {
        return a
    }
    public func foo(a: Int64) {
        return a
    }
}

main() {
    let i = A()
    let lambda = {x => i.foo(i.foo(x))}
}

// ASSERT: scan sema_lambdaExpr_must_have_type_annotation