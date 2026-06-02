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
    let timeEnum = ["20:01:60", "12:30:6"]

    for (dateTime in timeEnum) {
        if (!hasException({=> DateTime.parse(dateTime, "HH:mm:ss.S")})) {
            print("Failure")
        }
    }

    return 0
}
