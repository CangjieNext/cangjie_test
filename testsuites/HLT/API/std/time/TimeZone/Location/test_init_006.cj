/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

import std.time.*

main(): Int64 {
    let mylocation = ["/Astrakhan", "123", "abc"]

    var offset = -28800
    for (location in mylocation) {
        var loc1 = TimeZone(location, Duration.second * offset)
        var loc2 = TimeZone(location, Duration.second * offset)

        var now = DateTime.now()
        var time1 = now.inTimeZone(loc1)
        var time2 = now.inTimeZone(loc2)
    }

    return 0
}
