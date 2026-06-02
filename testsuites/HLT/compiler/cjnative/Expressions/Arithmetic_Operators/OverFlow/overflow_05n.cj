/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

enum Time {
    Day(Int32)
}

main(): Int64 {
    var time = Time.Day(2147483649)
    var res = match (time) {
        case Day(x) => x + 1
    }
    print(res.toString())
    if (res == 2147483650) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_exceed_num_value_range
