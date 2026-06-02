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

var r1: HashSet<String> = HashSet<String>()
var r4: HashSet<String> = HashSet<String>(3)

main(): Int64 {
    var r11 = r1.clone()
    var r41 = r4.clone()
    if (r11 != r1) {
        return 1
    }
    if (r41 != r4) {
        return 2
    }
    print("success1\n")
    return 0
}
