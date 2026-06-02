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
    var s2: String = "ha" //字母

    let ss1 = "A\u{fffe}bc1\u{fffe}23仓\u{fffe}颉\t\u{fffe}\n\b"

    var s3: String = s1.replace("12", s2)
    var s4: String = s1.replace("仓颉", "ha")
    var s5: String = s1.replace("\n", s2)

    let ss2 = ss1.replace("\u{fffe}", "ha")

    if (!(s3 == "Aaha仓颉\n\t" && s4 == "Aa12ha\n\t" && s5 == "Aa12仓颉ha\t")) {
        return 1
    }
    if (ss2 != "Ahabc1ha23仓ha颉\tha\n\b") {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
