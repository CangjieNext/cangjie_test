/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

extend Bool {
    public operator func ()(b: Bool): Int64 {
        1
    }
}

main(): Int64 {
    true(1)
    return 0
}
// ASSERT: scan sema_no_match_operator_function_call
// ASSERT: scan sema_cannot_convert_literal
