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
    var arr1 = ["hello", "cang", "jie"]
    let delimiter_str: String = " "

    if (String.join(arr1, delimiter: delimiter_str) != "hello cang jie") {
        return 1
    }

    if (String.join(arr1, delimiter: "") != "hellocangjie") {
        return 1
    }

    if (String.join(arr1, delimiter: "x") != "helloxcangxjie") {
        return 1
    }

    if (String.join(arr1, delimiter: "-") != "hello-cang-jie") {
        return 1
    }

    if (String.join(arr1, delimiter: "\'") != "hello'cang'jie") {
        return 1
    }

    if (String.join(arr1, delimiter: ":") != "hello:cang:jie") {
        return 1
    }

    if (String.join(arr1, delimiter: "+") != "hello+cang+jie") {
        return 1
    }

    if (String.join(arr1, delimiter: "=") != "hello=cang=jie") {
        return 1
    }

    if (String.join(arr1, delimiter: "(") != "hello(cang(jie") {
        return 1
    }

    if (String.join(arr1, delimiter: "\b") != "hello\bcang\bjie") {
        return 1
    }

    if (String.join(arr1, delimiter: "\n") != "hello\ncang\njie") {
        return 1
    }

    print(String.join(arr1, delimiter: "\u{fedc}"))
    if (String.join(arr1, delimiter: "\u{fedc}") != "hello\u{fedc}cang\u{fedc}jie") {
        return 1
    }

    if (String.join(arr1, delimiter: "仓") != "hello仓cang仓jie") {
        return 1
    }

    return 0
}
