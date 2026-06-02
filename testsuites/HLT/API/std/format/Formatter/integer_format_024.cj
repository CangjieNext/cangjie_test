/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args
import std.convert.*

main(): Int64 {
    var a: UInt32 = 4___29__49____67295
    var b: Int64 = -92____2_3_37_20____368_54___________77580______________8
    var c = 0
    var d = -0

    var res1 = a.format("-10.40")
    var res2 = b.format("+50.40")
    var res3 = (-429__49____67295).format("#50.40")
    var res4 = (-92____2_3_37_20____368_54___________77580______________8).format("#70.80b")

    if (res1 != "0000000000000000000000000000004294967295") {
        return 1
    }
    if (res2 != "         -0000000000000000000009223372036854775808") {
        return 2
    }
    if (res3 != "         -0000000000000000000000000000004294967295") {
        return 3
    }
    if (res4 != "-0b00000000000000001000000000000000000000000000000000000000000000000000000000000000") {
        return 4
    }

    return 0
}
