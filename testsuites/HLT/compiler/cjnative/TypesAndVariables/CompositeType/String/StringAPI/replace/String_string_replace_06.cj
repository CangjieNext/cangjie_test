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

func run(): Int64 {
    var s1: String = "Aa12仓颉\n\t\u{fffe}"
    var s2: String = ""

    var s3: String = s1.replace("Aa", s2)
    var s4: String = s1.replace("12", "")
    var s5: String = s1.replace("仓颉", s2)
    var s6: String = s1.replace("\n\t", s2)
    var s7: String = s1.replace("\u{fffe}", "")

    var s8: String = s2.replace("", s1)

    if (!(s3 == "12仓颉\n\t\u{fffe}" && s4 == "Aa仓颉\n\t\u{fffe}"
        && s5 == "Aa12\n\t\u{fffe}" && s6 == "Aa12仓颉\u{fffe}"
        && s7 == "Aa12仓颉\n\t")) {
        return 1
    }

    if (s8 != "Aa12仓颉\n\t\u{fffe}") {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
