/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args
//
// TEST INTENT: String results flow through launch and consumption
// DOC REF: ThreadGroup<T> with T = String
// EXPECT: joined "world,hello" in completion order (10ms before 30ms), exit 0

import std.collection.*
import std.concurrent.*
import std.sync.*

main(): Int64 {
    let joined = threadScope<String, String> {
        group =>
            group.launch {
                sleep(Duration.millisecond * 30)
                "hello"
            }
            group.launch {
                sleep(Duration.millisecond * 10)
                "world"
            }

            let parts = ArrayList<String>()
            for (value in group) {
                parts.add(value)
            }
            String.join(parts.toArray(), delimiter: ",")
    }
    return if (joined == "world,hello") { 0 } else { 1 }
}
