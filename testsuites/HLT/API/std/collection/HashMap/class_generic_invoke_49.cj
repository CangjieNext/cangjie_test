/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt -o %output %f
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

class Data<T> {
    public let width: T

    public init(x: T) {
        width = x
    }
}

func run(): Int64 {
    var MapWidth: HashMap<Int32, String> = HashMap<Int32, String>([(1, "Aa"), (2, "Bb"), (3, "Cc"), (1, "fir")])
    let data: Data<HashMap<Int32, String>> = Data<HashMap<Int32, String>>(MapWidth)
    var res = data.width
    if (res == MapWidth) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
