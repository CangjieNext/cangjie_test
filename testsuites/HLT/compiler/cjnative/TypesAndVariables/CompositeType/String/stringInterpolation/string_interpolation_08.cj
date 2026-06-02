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
    if (case01() != 0) {
        return 1
    }
    return 0
}

func case01() {
    var a = "abc"
    var b = 1
    var c = match ("${a}") {
        case "abd" => """
no"""
        case "abc" => "${"yes"}"
        case _ => #"no"#
    }
    if (c != "yes") {
        return 1
    }
    return 0
}
