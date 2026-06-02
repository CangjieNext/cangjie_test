/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class A {
    public operator func ()(input: A) {
        return 0
    }
    public func test() {
        this |> this
    }
}

main(): Int64 {
    return A().test()
}
// ASSERT: scan sema_flow_expressions_use_this_or_super
