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

func hasException(lamb: () -> TimeZone): Bool {
    try {
        lamb()
        return false
    } catch (e: Exception) {
        return true
    }
}

main(): Int64 {
    let mylocations = ["Europe/New_York", "America/ABCD", "/Los_Angeles", "America/LosAngeles", "America/Los Angeles",
        "America/Los_Angeles America/New_York", "America\\New_York", "Europe", "local", "utc1", ".", " "]

    for (location in mylocations) {
        if (!hasException({=> TimeZone.load(location)})) {
            print("Failure\n")
            print("location: " + location + "\n")
        }
    }

    return 0
}
