/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {
    public init(input: Int64) {}
    public var b: Int64 = 0
    public operator func ()(input: Int64) {
        input
    }
}

class B <: A {
    public init() {
        1 |> super
    }
}

main(): Int64 {
    B()
    return 0
}
// ASSERT: scan sema_no_non_param_constructor_in_super_class
