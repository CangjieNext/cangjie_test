/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.unicode.*

func run(): Int64 {
    var s1: String = ""
    var s2: String = "abCdEf"
    var s3: String = "1234356"
    var s4: String = "仓颉"
    var s5: String = "\b\n\t"
    var s6: String = "abCdEf1234356仓颉\b\n\t"

    var s7: String = "as23\b\n编程#*Msd"

    if (s1.removeSuffix("M") != "" || s2.removeSuffix("Ef") != "abCd" || s3.removeSuffix("4356") != "123") {
        return 1
    }

    if (s4.removeSuffix("颉") != "仓" || s5.removeSuffix("\t") != "\b\n" || s6.removeSuffix("颉\b\n\t") !=
        "abCdEf1234356仓") {
        return 1
    }

    if (s7.removeSuffix("QR") != "as23\b\n编程#*Msd") {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
