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
    var s1: String = String()
    var chs: Array<Rune> = [r'h', r'e', r'l', r'l', r'o', r' ']
    var s2: String = String(chs)
    var chs3: Array<Rune> = [r'仓', r'颉', r'编', r'程', r'语', r'言']
    var s3: String = String(chs3)

    print("s1 = " + s1 + "\n")
    print("s2 = " + s2 + "\n")
    print("s3 = " + s3 + "\n")

    if (s1 == "" && s2 == "hello " && s3 == "仓颉编程语言") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
