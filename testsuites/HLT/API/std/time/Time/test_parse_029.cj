/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt   %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-not Failure
// ASSERT: scan-not Exception

import std.time.*

func hasException(lamb: () -> DateTime): Bool {
    try {
        lamb()
        return false
    } catch (e: Exception) {
        return true
    }
}

main(): Int64 {
    let timeEnum = ["13:30:10", "23:30:10", "24:00:00"]

    for (dateTime in timeEnum) {
        if (!hasException({=> DateTime.parse(dateTime, "hh:mm:ss")})) {
            print("Failure")
        }
    }

    return 0
}
