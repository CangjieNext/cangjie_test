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

// 位操作符应用于入参
func foo<V>(x: V): V {
    return x
}

main(): Int64 {
    var x = foo<Int32>(!!!!10 << 1)
    if (x == 20) {
        return 0
    }
    return 1
}
