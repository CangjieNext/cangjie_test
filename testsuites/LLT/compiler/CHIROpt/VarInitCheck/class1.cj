// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)ERRCHECK: %compiler %disableSemaVic  %cmp_opt -Woff unused %diag_json %n.cj

open class A {
    var a1: Int32
    public init() {}
}

class B <: A {
    public let b1: A
    public var b2: Int32
    public mut prop b3: Int32 {
        get() {
            b2
        }
        set(v) {
            b2 = v
        }
    }
    public var b4: Int32
    public var b5: Int32 = a1
    public let b6: Int32
    public let b7: String
    public init() {
        b1.a1 = 2
        var v1 = b3
        println(b2)
        let v2 = b1.a1
        b2 = 12
        {=> var v3 = b2}()
        b1 = A()
        b1 = A()
    }
}

main(): Int32 {
    return 0
}
// ASSERT: scan chir_class_uninitialized_field
// ASSERT: scan chir_illegal_usage_of_super_member
// ASSERT: scan chir_used_before_initialization
// ASSERT: scan chir_illegal_usage_of_member
// ASSERT: scan chir_cannot_assign_initialized_let_variable
