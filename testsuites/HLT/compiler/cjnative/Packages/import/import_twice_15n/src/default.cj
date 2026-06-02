/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: p1
// EXEC: %compiler %cmp_opt %compile_lib_opt p1/a.cj -o p1.%middle
// ERRCHECK: %compiler %cmp_opt %f p1.%middle -o %output


import p1.{a as *}

main(): Int64 {
    if (v1 != 1) {
        return 1
    }
    if (v2 != 2) {
        return 2
    }
    return 0
}
// ASSERT: scan parse_expected_name
// ASSERT: scan parse_expected_right_delimiter
