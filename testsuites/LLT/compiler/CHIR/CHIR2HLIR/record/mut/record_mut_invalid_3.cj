// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f %diag_json -o %n.%suffix 2>&1 | compare %f

struct R1<T> {
    public var a: T

    public func foo1(x: T) {
        this.a = x
    }

    public func foo2(x: T) {
        a = x
    }
}

main() {
    return 1
}
// ASSERT: scan sema_cannot_modify_var
// ASSERT: scan sema_class_uninitialized_field
