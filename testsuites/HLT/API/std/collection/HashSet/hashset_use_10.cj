/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args|compare %f
// ASSERT: scan success1

import std.collection.*

var str1: Array<String> = ["a", "b"]
var r1: HashSet<String> = HashSet<String>(str1)

main(): Int64 {
    match (r1.iterator().next()) {
        case Some(x) =>
            print("success1\n")
            return 0
        case None => return 1
    }
}
