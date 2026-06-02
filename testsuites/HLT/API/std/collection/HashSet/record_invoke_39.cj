/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

struct Data<T> {
    public let width: T

    public Data(x: T) {
        width = x
    }
}

func run(): Int64 {
    var HashSetWidth: HashSet<Int32> = HashSet<Int32>([1, 2, 3, 4, 5, 6, 1])
    let data: Data<HashSet<Int32>> = Data<HashSet<Int32>>(HashSetWidth)
    var res = data.width
    if (res == HashSetWidth) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
