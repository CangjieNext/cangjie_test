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
    var s1: String = "Aa12仓颉\n\t"
    var s2: String = "\u{fffe}"

    var s3: String = s1.replace("Aa", s2)
    var s4: String = s1.replace("12", "\u{fffe}")
    var s5: String = s1.replace("仓颉", s2)
    var s6: String = s1.replace("\n", s2)

    if (s3 == "\u{fffe}12仓颉\n\t" && s4 == "Aa\u{fffe}仓颉\n\t"
        && s5 == "Aa12\u{fffe}\n\t" && s6 == "Aa12仓颉\u{fffe}\t") {
        return 0
    }

    return 1
}

main(): Int64 {
    return run()
}
