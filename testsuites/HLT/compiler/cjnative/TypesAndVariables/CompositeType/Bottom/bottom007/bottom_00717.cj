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
    public init(a: Int64) {}
}

class B <: A {
    public func test(): Int64 {
        super(return 0)
        return 1
    }
}

main(): Int64 {
    return B().test()
}
// ASSERT: scan sema_no_non_param_constructor_in_super_class
// ASSERT: scan sema_invalid_this_call_outside_ctor
