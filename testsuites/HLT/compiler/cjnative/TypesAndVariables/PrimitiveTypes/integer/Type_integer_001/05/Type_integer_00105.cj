/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f


main(): Int64 {
    var int8_Low_Median_One: Int 8 = 127

    if (int8_Low_Median_One == 127) {
        return 1
    } else {
        return 0
    }
}
// ASSERT: scan parse_expected_character
