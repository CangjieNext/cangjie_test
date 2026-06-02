/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

main(): Int64 {
    // list
    var list1: Array<Int32> = [1, 2, 3, 4, 2147483649]
    list1[4]
    list1[9223372036854775808]

    // range
    var rge = 9223372036854775808..9223372036854775808 : 9223372036854775808

    // tuple
    var tpl = (1, 23, 4, -9223372036854775810)
    tpl[9223372036854775809]
    print(tpl[3].toString())
    return 0
}
// ASSERT: scan sema_exceed_num_value_range
