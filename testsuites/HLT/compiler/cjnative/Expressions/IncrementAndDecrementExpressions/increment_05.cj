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

// TOP函数的block中使用自增减
main(): Int64 {
    if (run() == ()) {
        return 0
    }
    return 1
}

func run(): Unit {
    var i: Int64 = 2
    var j: Int32 = 0
    var a = {
        =>
        var j: Int32 = 0
        j++ // Unit
        j--
    }
    return a()
}
