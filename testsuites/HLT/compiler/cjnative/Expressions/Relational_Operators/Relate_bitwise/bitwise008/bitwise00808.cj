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

// 位操作符应用于函数返回值
func foo(): Int64 {
    var a: Int64 = 1
    var b: Int64 = 10
    return !(b >> a) >> a
}

main(): Int64 {
    var res = foo()
    if (res == -3) {
        return 0
    }
    return 1
}
