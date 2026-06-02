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

protected struct T_a {
    public var a: Int64
    public init(temp: Int64) {
        a = temp
    }
}

protected var test = T_a(1)
public var temp_test = test.a

main() {
    return temp_test - 1
}
