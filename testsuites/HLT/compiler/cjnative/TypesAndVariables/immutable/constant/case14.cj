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

func test() {
    const temp: Int64 = 90
    const a: String = match (temp) {
        case 0 => "zero"
        case _ => "other"
    }
    if (a == "zero") {
        return 1
    } else {
        return 0
    }
}

main() {
    return test()
}
