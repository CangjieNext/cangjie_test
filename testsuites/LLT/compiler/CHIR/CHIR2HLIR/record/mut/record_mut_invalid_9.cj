// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %enableCompileDebug %f %diag_json -o %n.%suffix 2>&1 | compare %f

struct R1<T> {
    public var i: T

    public init(x: T) {
        i = x
    }

    public mut func foo(x: T) {
        i = x
    }
}

main() {
    let obj = R1<Int64>(0)
    obj.foo(1)
    return 1
}
// ASSERT: scan sema_immutable_access_mutable_func
