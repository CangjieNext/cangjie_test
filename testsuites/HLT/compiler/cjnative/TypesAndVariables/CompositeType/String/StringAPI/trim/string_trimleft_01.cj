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
    var s1: String = "     hello Char lang "
    var s2 = "\u{5234} \u{5234} \u{5234} "
    var chs: Array<Rune> = [r' ', r'A', r'\u{0009}']
    var s3 = String(chs)
    var s4 = "    "
    var s5 = ""
    var s6 = "   hello"
    var s7 = "hello "

    var s1t: String = s1.trimLeft()
    var s2t: String = s2.trimLeft()
    var s3t: String = s3.trimLeft()
    var s4t: String = s4.trimLeft()
    var s5t: String = s5.trimLeft()
    var s6t: String = s6.trimLeft()
    var s7t: String = s7.trimLeft()

    print("s1 = [" + s1 + "]" + "\n")
    print("s1t = [" + s1t + "]" + "\n")
    print("s2 = [" + s2 + "]" + "\n")
    print("s2t = [" + s2t + "]" + "\n")
    print("s3 = [" + s3 + "]" + "\n")
    print("s3t = [" + s3t + "]" + "\n")
    print("s4 = [" + s4 + "]" + "\n")
    print("s4t = [" + s4t + "]" + "\n")
    print("s5 = [" + s5 + "]" + "\n")
    print("s5t = [" + s5t + "]" + "\n")
    print("s6 = [" + s6 + "]" + "\n")
    print("s6t = [" + s6t + "]" + "\n")
    print("s7 = [" + s7 + "]" + "\n")
    print("s7t = [" + s7t + "]" + "\n")

    if (s1t == "hello Char lang " && s2t == "\u{5234} \u{5234} \u{5234} " && s3t == "A\u{0009}" && s4t == "" && s5t == "" &&
        s6t == "hello" && s7t == "hello ") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
