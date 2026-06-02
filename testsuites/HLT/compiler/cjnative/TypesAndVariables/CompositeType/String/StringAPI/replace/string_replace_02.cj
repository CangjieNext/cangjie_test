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
    var oldStr: String = "hello Char lang"
    var oldStr1 = "hello Char lang"
    var chs = [r'h', r'e', r'l', r'l', r'o', r' ', r'c', r'h', r'a', r'r', r' ', r'l', r'a', r'n', r'g']
    var oldStr2 = String(chs)
    var newStr: String = oldStr.replace("l", "-")
    var newStr1: String = oldStr1.replace("l", "-")
    var newStr2: String = oldStr2.replace("l", "-")
    var str = "he--o Char -ang"

    print("oldStr = " + oldStr + "\n")
    print("oldStr1 = " + oldStr + "\n")
    print("oldStr2 = " + oldStr + "\n")
    print("newStr = " + newStr + "\n")
    print("newStr1 = " + newStr1 + "\n")
    print("newStr2 = " + newStr2 + "\n")

    if (newStr == str) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
