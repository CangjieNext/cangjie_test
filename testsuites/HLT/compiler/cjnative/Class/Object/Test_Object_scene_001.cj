/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// (JS) EXEC: cp -r %stdpath .
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    func x(a: Int64): Object {
        Object()
    }
    var myArray: ArrayList<Object> = ArrayList<Object>(5, x)

    if (myArray.isEmpty()) {
        return 1
    }

    if (myArray.size != 5) {
        return 1
    }

    return 0
}
