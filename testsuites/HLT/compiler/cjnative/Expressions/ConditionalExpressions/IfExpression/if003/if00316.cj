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
    public var a: Int32 = 0
}

class Point <: A {
    public var x: Int32 = 0
    public var y: Int32 = 0
    public func test() {
        if (true) {
            super.a = 1
            super()
        }
    }
}

main(): Int64 {
    return 0
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
