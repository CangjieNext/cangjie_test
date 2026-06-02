/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
import std.collection.*

main(): Int64 {
    var str1 = """
true"""
    var str2 = """
false"""
    var str3 = ###"true"###
    var str4 = ###"false"###
    var str5 = "${true}"
    var str6 = "${false}"

    var arr1 = [str1, str2, str3, str4, str5, str6, "true", "false", #"true"#, #"false"#]
    var arr2 = ArrayList<Bool>()
    var arr3 = ArrayList<Bool>([true, false, true, false, true, false, true, false, true, false])
    for (i in arr1) {
        arr2.add(Bool.tryParse(i).getOrThrow())
    }
    if (arr2 != arr3) {
        return 1
    }
    return 0
}
