/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %cmp_utest_opt %f -o %output
// (not iOS) RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.core.*
import std.sync.*

main(): Int64 {
    let fut: Future<Int64> = spawn {
        sleep(Duration.second)
        return 1
    }

    let res: Option<Int64> = fut.get(Duration.millisecond)

    match (res) {
        case Some(val) => println("result = ${val}")
        case None => println("None")
    }
    return 0
}
