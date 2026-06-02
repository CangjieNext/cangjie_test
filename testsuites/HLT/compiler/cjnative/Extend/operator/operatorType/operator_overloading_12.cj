/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    var a: Int32 = 1

    if (-a != "abc") {
        return 1
    }
    return 0
}

extend Int32 {
    public operator func -(): String {
        return "abc"
    }
}
// ASSERT: scan sema_invalid_binary_expr
// ASSERT: scan sema_operator_overload_built_in_unary_operator
