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

    var resultActual: Array<Int64> = [order01.hashCode(), order02.hashCode(), order03.hashCode()]
    var resultExpect: Array<Int64> = [1, 2, 3]
    if (resultActual != resultExpect) {
        return 1
    }
    return 0
}
