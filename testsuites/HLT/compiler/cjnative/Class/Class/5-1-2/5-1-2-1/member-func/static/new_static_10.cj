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
    private static func f(): Int64 {
        return 1
    }
    public static func get(): Int64 {
        return f()
    }
}

class Data <: Base {}

main(): Int64 {
    return Int64(Data.get() - 1)
}
