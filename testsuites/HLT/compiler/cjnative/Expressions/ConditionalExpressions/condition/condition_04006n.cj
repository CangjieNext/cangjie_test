/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 3
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_backarrow_in_let_cond

// 关系操作符： ==

main() {
    var a = false
    while (let a == false <- 1 ) {
        return 0
    }
    return 1
}


