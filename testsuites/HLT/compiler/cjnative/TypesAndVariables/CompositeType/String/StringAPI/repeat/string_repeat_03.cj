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
    var s1: String = "hello Char lang "
    var s2 = ""
    var s3 = " "

    var s4: String = s1 * 1
    var s5: String = s1 * 2
    var s6: String = s2 * 1
    var s7: String = s2 * 2
    var s8: String = s3 * 1
    var s9: String = s3 * 2
    var s10: String = "a" * 3

    print("s1 = " + s1 + "\n")
    print("s1*1 = " + s4 + "\n")
    print("s1*2 = " + s5 + "\n")
    print("s2*1 = [" + s6 + "]" + "\n")
    print("s2*2 = [" + s7 + "]" + "\n")
    print("s3*1 = [" + s8 + "]" + "\n")
    print("s4*2 = [" + s9 + "]" + "\n")
    print("\"a\"*3 = [" + s10 + "]" + "\n")

    if (s4 == "hello Char lang " && s5 == "hello Char lang hello Char lang " && s6 == "" && s7 == "" && s8 == " " &&
        s9 == "  " && s10 == "aaa") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
