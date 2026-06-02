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
    var s2: String = "77"

    let ss1 = "A\u{fffe}bc1\u{fffe}23仓\u{fffe}颉\t\u{fffe}\n\b"

    var s3: String = s1.replace("Aa", s2)
    var s4: String = s1.replace("仓颉", s2)
    var s5: String = s1.replace("\t", "77")

    let ss2 = ss1.replace("\u{fffe}", "77")

    if (!(s3 == "7712仓颉\n\t" && s4 == "Aa1277\n\t" && s5 == "Aa12仓颉\n77")) {
        return 1
    }
    if (ss2 != "A77bc17723仓77颉\t77\n\b") {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
