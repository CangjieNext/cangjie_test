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
    var s1: String = "a"
    var s2 = ""

    var s3: String = s1 * 0
    var s4: String = s1 * 92
    var s5: String = s2 * 0
    var s6: String = s2 * 92

    var str = ""
    for (i in 0..92 : 1) {
        str = str + "a"
    }

    print("s1 = " + s1 + "\n")
    print("s1*0 = " + s3 + "\n")
    print("s1*92 = " + s4 + "\n")
    print("s2*0 = " + s5 + "\n")
    print("s2*92 = " + s6 + "\n")

    if (s3 != s1 && s5 == s2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
