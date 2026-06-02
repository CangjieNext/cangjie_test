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

main(): Int64 {
    return Int64(Data.foo(3) - 3)
}

open class Base {
    public static func foo(a: Int32): Int32 {
        return a
    }
}

open class Mid1 <: Base {}

open class Mid2 <: Mid1 {}

open class Mid3 <: Mid2 {}

open class Mid4 <: Mid3 {}

open class Mid5 <: Mid4 {}

open class Mid6 <: Mid5 {}

open class Mid7 <: Mid6 {}

class Data <: Mid7 {}
