/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<X> {
    public operator func ()<T>(input: Int64): Int32 {
        Int32(input)
    }
    public operator func ()<T>(input: Int32): Int64 {
        Int64(input)
    }
    public operator func ()<T>(input: (Int64) -> Int64): Int64 {
        input(1)
    }
}

main(): Int64 {
    1 |> A()
    return 0
}
// ASSERT: scan sema_generic_in_operator_overload
// ASSERT: scan sema_unable_to_infer_generic_func
