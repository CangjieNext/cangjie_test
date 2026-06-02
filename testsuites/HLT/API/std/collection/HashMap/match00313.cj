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
import std.collection.*

func test(): Int64 {
    var i: Int32 = 0
    var a: HashMap<Int32, Int32> = HashMap<Int32, Int32>([(0, 1)])
    match (i) {
        case _ => a
    }
    return 0
}

main(): Int64 {
    return test()
}
