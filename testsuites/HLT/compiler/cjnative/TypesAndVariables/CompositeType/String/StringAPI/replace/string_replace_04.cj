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
    var s1 = "a"
    var s2 = "b"
    var s3 = "    "

    var s4 = s1.replace("a", " ")
    var s5 = s2.replace("b", "d")
    var s6 = s3.replace(" ", "e")

    print("oldStr1 = " + s1 + "\n")
    print("oldStr2 = " + s2 + "\n")
    print("oldStr3 = " + s3 + "\n")
    print("s4 = " + s4 + "\n")
    print("s5 = " + s5 + "\n")
    print("s6 = " + s6 + "\n")

    if (s4 == " " && s5 == "d" && s6 == "eeee") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
