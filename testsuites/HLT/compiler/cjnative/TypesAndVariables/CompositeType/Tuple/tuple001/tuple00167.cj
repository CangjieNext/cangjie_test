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
    public var a: Int32 = 1
}

class B <: A {
    public var b: Int32
    public init() {
        this.b = 1
    }
    public var MyTuple = (this, this)
}

main(): Int64 {
    var a = B()
    return 0
}
// ASSERT: scan sema_this_or_super_not_allowed_to_initialize_non_static_member
