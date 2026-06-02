/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 1ns1us1ms1s1m1h
import std.time.*

main(): Int64 {
    print(Duration.nanosecond)
    print(Duration.microsecond)
    print(Duration.millisecond)
    print(Duration.second)
    print(Duration.minute)
    print(Duration.hour)

    return 0
}
