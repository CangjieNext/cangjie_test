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

main(): Int64 {
    var arr1 = ["1", "23456", "789"]
    let delimiter_str: String = " "

    if (String.join(arr1, delimiter: delimiter_str) != "1 23456 789") {
        return 1
    }

    if (String.join(arr1, delimiter: "") != "123456789") {
        return 1
    }

    if (String.join(arr1, delimiter: "-") != "1-23456-789") {
        return 1
    }

    if (String.join(arr1, delimiter: "\'") != "1'23456'789") {
        return 1
    }

    if (String.join(arr1, delimiter: ":") != "1:23456:789") {
        return 1
    }

    if (String.join(arr1, delimiter: "+") != "1+23456+789") {
        return 1
    }

    if (String.join(arr1, delimiter: "=") != "1=23456=789") {
        return 1
    }

    if (String.join(arr1, delimiter: "(") != "1(23456(789") {
        return 1
    }

    if (String.join(arr1, delimiter: "\b") != "1\b23456\b789") {
        return 1
    }

    if (String.join(arr1, delimiter: "\n") != "1\n23456\n789") {
        return 1
    }

    if (String.join(arr1, delimiter: "\u{fedc}") != "1\u{fedc}23456\u{fedc}789") {
        return 1
    }

    if (String.join(arr1, delimiter: "仓") != "1仓23456仓789") {
        return 1
    }

    return 0
}
