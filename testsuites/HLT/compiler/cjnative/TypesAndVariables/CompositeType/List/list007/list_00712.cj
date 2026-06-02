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

type a = Int64

type b = Int64

func test(): Int64 {
    var x: a = 1
    var y: b = 2
    var z = [x, y]
    return z.size - 2
}

main(): Int64 {
    return test()
}
