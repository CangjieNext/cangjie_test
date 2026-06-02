/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    public operator func ()(input: A) {}
    public init(a: A) {}
    public init(a: String) {
        this |> this
    }
}

main(): Int64 {
    A("1")
    return 0
}
// ASSERT: scan sema_flow_expressions_use_this_or_super
