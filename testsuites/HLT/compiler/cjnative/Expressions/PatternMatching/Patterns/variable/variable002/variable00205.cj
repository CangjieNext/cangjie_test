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

class Good {
    public var grade: String = ""
    public init(x: Int32) {
        if (x > 60) {
            grade = "good"
        } else {
            grade = "N/A"
        }
    }
}

main(): Int64 {
    var i: Int32 = 90
    var result = match (i) {
        case 60 => "pass"
        case 100 => "Full"
        case good => Good(good).grade
    }
    if (result == "good") {
        return 0
    }
    return 1
}
