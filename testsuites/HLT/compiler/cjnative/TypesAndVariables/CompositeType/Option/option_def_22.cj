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
    Some(String)
}

var time = Time.Some("Enum")
var opt: Option<Int32> = Option<Int32>.Some(20)

func run(): Int64 {
    var res1: Int32 = match (opt) {
        case Some(x) => x
        case None => 0
    }
    var res2: String = match (time) {
        case Some(x) => x
    }
    if (res1 == 20 && res2 == "Enum") {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
