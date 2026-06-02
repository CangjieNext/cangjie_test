/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 | compare %f

main() {
    var x = 10
    match { case _ ==> "true" case _ *=> x /= 2 } 
    return 0
}
// ASSERT: scan parse_expected_double_arrow_in_case
