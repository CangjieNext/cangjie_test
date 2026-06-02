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

type str = String

type float = Float64

type multitype1 = (String, Int8)

type multitype2 = (str, float, multitype1)

main(): Int64 {
    let tuple1: (multitype2, str, multitype1) = (("pi=", 3.1415926, ("a=", 126 + 1)), "->", ("b=", -127 - 1))
    let str1: str = tuple1[0][0] + tuple1[0][1].toString() + ","
    var str2: str = tuple1[0][2][0] + tuple1[0][2][1].toString() + tuple1[1]
    var str3: String = tuple1[2][0] + tuple1[2][1].toString()
    if (str1 + str2 + str3 == "pi=3.141593,a=127->b=-128") {
        return 0
    }
    return 1
}
