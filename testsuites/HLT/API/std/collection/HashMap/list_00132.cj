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
    var a: Array<HashMap<Int64, Int64>> = [HashMap<Int64, Int64>([(1, 1)])]
    var b: Array<HashMap<Int64, Int64>> = [HashMap<Int64, Int64>([(1, 1)])].toArray()
    var c: Array<HashMap<Int64, Int64>> = Array<(HashMap<Int64, Int64>)>(1, repeat: HashMap<Int64, Int64>([(1, 1)]))
    return a.size + b.size + c.size - 3
}

main(): Int64 {
    return test()
}
