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
    var s1: String = "hello Char lang"
    var s2 = ""
    var s3: String = s1.padStart(16, padding: "a")
    var s4: String = s1.padStart(16, padding: " ")
    var s5: String = s1.padStart(20, padding: "\u{5234}")
    var s6: String = s1.padStart(16, padding: "\n")
    var s7: String = s2.padStart(3, padding: "a")
    var s8: String = s2.padStart(3, padding: "!")
    var s9: String = "a".padStart(3, padding: "!")

    print("s1 = " + s1 + "\n")
    print("s1.padStart(16, padding:'a') = " + s3 + "\n")
    print("s1.padStart(16, padding:' ') = " + s4 + "\n")
    print("s1.padStart(20, padding:'\u{5234}') = " + s5 + "\n")
    print("s1.padStart(16, padding:'\n') = " + s6 + "\n")
    print("s2.padStart(3, padding:'a') = " + s7 + "\n")
    print("s2.padStart(3, padding:'!') = " + s8 + "\n")
    print("\"a\".padStart(3, padding:'!') = " + s9 + "\n")

    if (s3 == "a" + s1 && s4 == " " + s1 && s5 == "\u{5234}\u{5234}" + s1 && s6 == "\n" + s1 && s7 == "aaa" + s2 &&
        s8 == "!!!" + s2 && s9 == "!!a") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
