/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

main() {
    var order01 = Ordering.LT
    var order02 = Ordering.EQ
    var order03 = Ordering.GT
    if (order01.toString() != "Ordering.LT") {
        return 1
    }
    if (order02.toString() != "Ordering.EQ") {
        return 2
    }
    if (order03.toString() != "Ordering.GT") {
        return 3
    }
    return 0
}
