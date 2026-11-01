// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %diag_json %f -o %output 2>&1 | compare %f
// ASSERT: scan-not internal Compiler Error
// ASSERT: scan sema_invalid_override_or_redefine_member_in_interface

interface I {
    func callee(): Unit {}
}

abstract class B <: I {}

abstract class C <: B {
    public func caller(): Unit {
        this.callee()
    }

    public func callee(): Unit
}
