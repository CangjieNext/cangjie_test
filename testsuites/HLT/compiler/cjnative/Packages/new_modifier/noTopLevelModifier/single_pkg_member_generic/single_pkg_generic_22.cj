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

public class BB {}

public class test<T> where T <: BB {
    var a = 0
    protected operator func ()() {
        1
    }
}

internal var test1 = test<BB>()
public var temp_test = test1()

main() {
    return temp_test - 1
}
