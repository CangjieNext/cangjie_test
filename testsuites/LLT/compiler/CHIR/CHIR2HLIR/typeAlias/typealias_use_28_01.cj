// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

type i64 = Int64

type ran = Range<i64>

type ran2<T> = Range<i64>

main(): Int64 {
    var str1: String = ""
    var r1: ran = 1..2

    var str2: String = ""
    var r2: ran2<Int64> = 3..4

    for (number in r1) {
        str1 = "${number}"
        print("${number}")
    }

    for (number in r2) {
        str2 = "${number}"
        print("${number}")
    }
    if (str1 == "1" && str2 == "3") {
        return 0
    } else {
        return 1
    }
}
