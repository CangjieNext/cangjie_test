/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



main():Int64{
    var i : Int64 = 1
    for (x in 0..100) {
        var y : Int64 = match (i) {
            case _ if (break) => i 
            case _ => i + 1
        }
    }
    return 0
}
// ASSERT: scan parse_expected_double_arrow_in_case
