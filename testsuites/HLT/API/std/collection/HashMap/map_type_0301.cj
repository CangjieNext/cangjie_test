/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args
import std.collection.*

main(): Int64 {
    var map02 = HashMap<Bool, Int64>([(true, 2), (false, 5)])
    var map04: HashMap<Bool, Int64> = HashMap<Bool, Int64>(map02)
    if (map04[false] != 5) {
        return 1
    }
    print("${map04[false]}\n")
    return 0
}
