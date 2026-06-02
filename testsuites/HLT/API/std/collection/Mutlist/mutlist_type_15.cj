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

import std.collection.*

main(): Int64 {
    var rs: Array<UInt8> = [3, 4]
    var r1 = ArrayList<Array<UInt8>>([rs])
    var r2 = ArrayList<Array<UInt8>>([[3u8, 4u8]])

    if (r1.size != 1) {
        return 1
    }
    if (r2.size != 1) {
        return 2
    }
    if (r2[0][0] != UInt8(3)) {
        return 3
    }
    if (r2[0][1] != UInt8(4)) {
        return 4
    }
    if (r1[0][0] != UInt8(3)) {
        return 5
    }
    if (r1[0][1] != UInt8(4)) {
        return 6
    }
    return 0
}
