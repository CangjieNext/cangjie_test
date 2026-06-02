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
    var newStr: String = oldStr.replace("!", "?")

    print("oldStr = " + oldStr + "\n")
    print("newStr = " + newStr + "\n")

    if (newStr == oldStr) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
