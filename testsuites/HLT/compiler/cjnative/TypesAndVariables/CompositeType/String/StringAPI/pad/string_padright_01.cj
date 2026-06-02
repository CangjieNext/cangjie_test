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

    var s3: String = s1.padEnd(2, padding: "a")
    var s4: String = s1.padEnd(14, padding: "a")
    var s5: String = s1.padEnd(15, padding: "a")
    var s6: String = s2.padEnd(0, padding: "a")
    var s7: String = "hello Char lang".padEnd(2, padding: "a")

    print("s1 = " + s1 + "\n")
    print("s1.padEnd(0, padding:'a') = " + s3 + "\n")
    print("s1.padEnd(14, padding:'a') = " + s4 + "\n")
    print("s1.padEnd(15, padding:'a') = " + s5 + "\n")
    print("s2.padEnd(0, padding:'a') = " + s6 + "\n")
    print("\"hello Char lang\".padEnd(2, padding:'a') = " + s7 + "\n")

    if (s3 == s1 && s4 == s1 && s5 == s1 && s6 == s2 && s7 == s1) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
