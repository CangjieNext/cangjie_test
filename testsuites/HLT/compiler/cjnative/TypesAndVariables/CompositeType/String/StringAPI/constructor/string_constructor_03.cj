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
    var chs1 = Array<Rune>()
    var chs2 = [r' ']
    var chs3 = [r'h', r'e', r'l', r'l', r'o', r' ']
    var chs4 = Array<Rune>(5, {i => r'l'})
    var s1: String = String(chs1)
    var s2: String = String(chs2)
    var s3: String = String(chs3)
    var s4: String = String(chs4)

    print("s1 = " + s1 + "\n")
    print("s2 = " + s2 + "\n")
    print("s3 = " + s3 + "\n")
    print("s4 = " + s4 + "\n")

    if (s1 == "" && s2 == " " && s3 == "hello " && s4 == "lllll") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
