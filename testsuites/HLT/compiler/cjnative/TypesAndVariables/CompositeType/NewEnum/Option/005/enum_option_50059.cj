/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test(): Option<Int64> {
    Some {} ?? {=>}
    return Some(0)
}

main(): Int64 {
    return test() ?? 1
}
// ASSERT: scan sema_trailing_lambda_cannot_used_for_non_function
