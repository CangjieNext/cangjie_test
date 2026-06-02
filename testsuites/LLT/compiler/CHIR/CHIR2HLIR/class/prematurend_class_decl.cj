// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %core_cmp_opt %f %diag_json

main(): Int64 {
    return 0
}

open class GrandFather {
    public GrandFather(public var a: Int64) {}
}

open class Father <: GrandFather {
    public Father(a: Int64) {
        super(a)
    }
}

class Child <: Father {
    Child(public var a: Int64) {
        super(a)
    }
}
// ASSERT: scan sema_member_variable_can_not_shadow
