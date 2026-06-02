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

var top: Int64 = 0

struct rec<T> {
    static var a: Int64 = 0
    static init() {
        top++
    }
}

main(): Int64 {
    var exam1 = rec<Int64>.a
    var exam2 = rec<Int64>.a
    var exam3 = rec<Int64>.a
    var exam4 = rec<Int64>.a
    var exam5 = rec<Int64>.a

    if (top == 1) {
        return 0
    }
    return 1
}
