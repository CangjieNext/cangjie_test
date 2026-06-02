/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f

class Test {
    public var a: Int32 = 3
    public init() {}

    public init(i: Int32) {
        this()
        super()
    }
}

class Test2 {
    public var a: Int32 = 3
    public init() {}

    public init(i: Int32) {
        super()
        this()
    }
}

main(): Int64 {
    return Int64(Test().a)
}
// ASSERT: scan sema_illegal_place_of_calling_this_or_super
