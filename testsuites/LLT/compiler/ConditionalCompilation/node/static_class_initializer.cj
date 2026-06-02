// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj
// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json

class C {
    static let m: Int64

    @When[!debug] // static initializer
    static init() {
        m = 180
    }
}

main() {
    C.m
}
// ASSERT: scan sema_type_uninitialized_static_field
