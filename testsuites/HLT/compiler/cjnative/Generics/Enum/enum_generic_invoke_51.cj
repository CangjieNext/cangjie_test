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

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var pie: (Float64, String) = (3.14, "PIE")
    var time = Time<(Float64, String)>.Day(pie)
    var res: String = match (time) {
        case Day(x) => pie[0].toString() + pie[1]
    }
    if (res == "3.140000PIE" || res == "3.14PIE") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
