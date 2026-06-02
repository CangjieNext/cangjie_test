// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f %diag_json -o %n.%suffix 2>&1 | compare %f

struct R1 {
    public var a: Int64 = 0

    public func foo1() {
        this.a = 1
    }

    public func foo2() {
        a = 1
    }

    public func foo3() {
        this.a += 1
    }
}

main() {
    return 1
}
// ASSERT: scan sema_cannot_modify_var
