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

func run(opt1: Option<Int32>, opt2: Option<Int32>): Int64 {
    var res1: Int32 = match (opt1) {
        case Some(x) => x
        case None => 0
    }
    var res2: Int32 = match (opt2) {
        case Some(x) => x
        case None => 0
    }
    if (res1 == 3 && res2 == 0) {
        return 0
    }
    return 1
}

main(): Int64 {
    var opt1: Option<Int32> = Some<Int32>(3)
    var opt2: Option<Int32> = None<Int32>
    return run(opt1, opt2)
}
