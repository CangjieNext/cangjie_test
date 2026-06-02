/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

//brief:Buffer的构造器Buffer<T>() where T <: Equatable<T> {}
//detail:ArrayList<T>()

import std.collection.*

var r: ArrayList<Int64> = ArrayList<Int64>()

func case01() {
    var a = r.size
    return a
}

main(): Int64 {
    if (case01() != 0) {
        return 1
    }
    return 0
}
