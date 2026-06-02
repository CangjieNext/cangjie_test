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

open class Base {
    public var a: Int32 = 1
}

class Data <: Base {}

func run(): Int64 {
    var value: Data = Data()
    if (value.a != 1) {
        return 1
    }
    return 0
}

main(): Int64 {
    return run()
}
