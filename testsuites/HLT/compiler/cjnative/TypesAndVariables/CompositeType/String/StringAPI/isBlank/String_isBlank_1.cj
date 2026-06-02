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
    var s2: String = "\t\n\r\f"
    var s3: String = "sdfsd"
    var s4: String = "仓颉编程测试"
    var s5: String = "\n\b\t\b测试\b45\b\t\t\n\r\ftsaddf345a"
    let s6 = "\u{fffe}"
    let s7 = "A\u{fffe}bc1\u{fffe}23仓\u{fffe}颉\t\u{fffe}\n\b"

    if (s1.isBlank() != true || s2.isBlank() != true || s3.isBlank() != false) {
        return 1
    }
    if (s4.isBlank() != false || s5.isBlank() != false || s6.isBlank() != false || s7.isBlank() != false) {
        return 1
    }

    return 0
}

main(): Int64 {
    return run()
}
