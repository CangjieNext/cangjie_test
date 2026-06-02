/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

type ch = Rune

type li = Array<ch>

var list: li = [r'a', r'b']

main(): Int64 {
    if (list[0] == r'a' && list[1] == r'b') {
        return 0
    } else {
        return 1
    }
}
