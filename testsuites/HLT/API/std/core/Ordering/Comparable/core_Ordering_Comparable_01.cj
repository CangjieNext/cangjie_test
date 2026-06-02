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
    var order04 = Ordering.LT
    var order05 = Ordering.EQ
    var order06 = Ordering.GT
    if (!(order01 == order04)) {
        return 1
    }
    if (!(order02 == order05)) {
        return 2
    }
    if (!(order03 == order06)) {
        return 3
    }
    if (order01 == order02) {
        return 4
    }
    if (order01 == order03) {
        return 5
    }
    if (order03 == order02) {
        return 6
    }
    return 0
}
