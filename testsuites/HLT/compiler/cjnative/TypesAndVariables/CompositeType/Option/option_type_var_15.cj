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

enum Time {
    Day(Option<Int32>)
}

func run(): Int64 {
    var time: Time = Time.Day(Option<Int32>.Some(4))
    var res: Int32 = match (time) {
        case Day(x) => match (x) {
            case Some(x) => x
            case None => 0
        }
    }
    if (res == 4) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
