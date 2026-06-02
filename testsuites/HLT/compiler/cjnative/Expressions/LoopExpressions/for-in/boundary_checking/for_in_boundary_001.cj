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

func forinrange(start: Int64) {
    var count = 0
    for (_ in start..start) {
        count++
    }
    if (count != 0) {
        throw Exception("unexpected result in start = ${start}")
    }
}

main() {
    forinrange(0)
    forinrange(-1)
    forinrange(9223372036854775807)
    forinrange(-9223372036854775808)
}
