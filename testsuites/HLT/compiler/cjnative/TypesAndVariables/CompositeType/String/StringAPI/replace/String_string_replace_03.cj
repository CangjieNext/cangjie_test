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
    var s2: String = "编程"

    let ss1 = "A\u{fffe}bc1\u{fffe}23仓\u{fffe}颉\t\u{fffe}\n\b"

    var s3: String = s1.replace("Aa", "编程")
    var s4: String = s1.replace("12", s2)
    var s5: String = s1.replace("\t", s2)

    let ss2 = ss1.replace("\u{fffe}", "哈哈")

    if (!(s3 == "编程12仓颉\n\t" && s4 == "Aa编程仓颉\n\t" && s5 == "Aa12仓颉\n编程")) {
        return 1
    }
    if (ss2 != "A哈哈bc1哈哈23仓哈哈颉\t哈哈\n\b") {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
