/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler  %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public func h1(x: Int64): Int64 {
    x
}

protected func h2(x: Int64): Int64 {
    x
}

var hh = h1 ~> h2

main(): Int64 {
    return hh(1) - 1
}
