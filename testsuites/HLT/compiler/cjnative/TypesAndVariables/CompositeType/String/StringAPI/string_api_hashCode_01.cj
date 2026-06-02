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
    var str1 = "abc"
    var str2 = ""
    var str3 = "中国"
    var res1 = str1.hashCode()
    var res2 = str2.hashCode()
    var res3 = str3.hashCode()
    if (res1 != -490330207908981162) {
        return 1
    }
    if (res2 != 2302960717771869484) {
        return 2
    }
    if (res3 != 6009178520575619900) {
        return 3
    }
    return 0
}
