/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan pass

import std.collection.*

main(): Int64 {
    var hashmap3: HashMap<Int8, String> = HashMap<Int8, String>(100, {x: Int64 => (Int8(x), x.toString())})
    if (hashmap3.size == 100) {
        print("pass")
        return 0
    }
    return 1
}
