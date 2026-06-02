// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %diag_json %n.cj -o %n.%suffix 2>&1 | compare %f

public func boo<T>(a: T, b: T) where T <: Int64 {
    return a + b
}

main() {
    return boo<Int64>(1, 2)
}
// ASSERT: scan sema_upper_bound_must_be_class_or_interface
// ASSERT: scan sema_invalid_binary_expr
