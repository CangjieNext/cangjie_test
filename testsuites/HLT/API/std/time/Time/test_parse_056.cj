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
    let timeEnum = [("2020-", "yyyy-"), ("2020-", "yyyyM-"), ("2020-02-", "yyyy-MM-"), ("2020-02-10", "yyyy-MM-dds"),
        ("2020-02-10T08:", "yyyy-MM-ddThhm:"), ("2020-02-10T08:30:", "yyyy-MM-ddThh:mms:"),
        ("2020-02-10T08:30:00", "yyyy-MM-ddThh:mm:ssm"), ("2020-02-10T08:30:00", "yyyy-mmd-ddThh:mm:ss"),
        ("2020-02-10T08:30:00", "yyyy-MMd-ddThh:mm:ss"), ("2020-02-10T08:30:00", "yyyy-MM-MdThh:mm:ss"),
        ("2020-02-10T08:30:00", "yyyy-ddy-MMThh:mm:ss"), ("2020-02-10T08:30:00", "yyyy-MM-ddThhm:mm:ss"),
        ("2020-02-10T08:30:00", "yyyy-MM-ddThh:mms:ss"), ("2020-02-10T08:30:00", "yyyy-MM-ddThh:mm:mss"),
        ("2020-02-10T08:30:00+08:00", "yyyy-MM-ddThh:mm:ssZZZZs")]

    for (dateTime in timeEnum) {
        if (!hasException({=> DateTime.parse(dateTime[0], dateTime[1])})) {
            print("Failure: " + dateTime[1] + "\n")
        }
    }

    return 0
}
