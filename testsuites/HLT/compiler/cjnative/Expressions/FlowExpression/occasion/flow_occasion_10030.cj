/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func a(input: Int64): Int64 {
    input
}

open class A {
    public operator func ()() {}
    public operator func ()(input: Int64) {}
    public operator func ()(input: (Int64) -> Int64) {}
}

class B <: A {
    public init() {
        super() // init for super
        super(1 |> a)
        super(a ~> a)
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_illegal_place_of_calling_this_or_super
// ASSERT: scan sema_wrong_number_of_arguments
