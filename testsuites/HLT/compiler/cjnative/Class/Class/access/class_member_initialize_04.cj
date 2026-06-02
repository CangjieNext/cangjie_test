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

class Data {
    public var score: String
    public init(x: Int32) {
        score = match (x) {
            case 60 => "PASS"
            case 90 => "excellent"
            case _ => "NA"
        }
    }
}

main(): Int64 {
    var data1 = Data(90)
    if (data1.score == "excellent") {
        return 0
    }
    return 1
}
