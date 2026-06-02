/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main() {
    var a = 1
    var s = "test"
    while (let "test${s}" <- "test${s}") {
        a--;
        break
    }
    return a
}
// ASSERT: scan sema_interpolation_in_const_pattern
