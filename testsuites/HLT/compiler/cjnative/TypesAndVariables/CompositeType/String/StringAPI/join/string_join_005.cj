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
    var arr1 = ["==", "@#$^&*", "(){}<>"]
    let delimiter_str: String = " "

    if (String.join(arr1, delimiter: delimiter_str) != "== @#$^&* (){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: "") != "==@#$^&*(){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: "-") != "==-@#$^&*-(){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: "\'") != "=='@#$^&*'(){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: ":") != "==:@#$^&*:(){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: "+") != "==+@#$^&*+(){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: "=") != "===@#$^&*=(){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: "(") != "==(@#$^&*((){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: "\b") != "==\b@#$^&*\b(){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: "\n") != "==\n@#$^&*\n(){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: "\u{ed3a}") != "==\u{ed3a}@#$^&*\u{ed3a}(){}<>") {
        return 1
    }

    if (String.join(arr1, delimiter: "仓") != "==仓@#$^&*仓(){}<>") {
        return 1
    }

    return 0
}
