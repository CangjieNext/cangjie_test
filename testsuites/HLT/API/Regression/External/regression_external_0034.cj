/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %overflow_wrapping %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.time.*

main(): Int64 {
    let standardTime = DateTime.ofUTC(year: 1970, month: Month.of(1), dayOfMonth: 1)
    let time1 = DateTime.of(year: 2262, month: Month.of(4), dayOfMonth: 11, hour: 23, minute: 47, second: 16)
    let time2 = DateTime.of(year: 9999, month: Month.of(12), dayOfMonth: 11, hour: 23, minute: 59, second: 59)
    var res1 = standardTime + (time1 - standardTime)
    if (res1 != time1) {
        return 1
    }
    var res2 = standardTime + (time2 - standardTime)
    if (res2 != time2) {
        return 1
    }
    return 0
}
