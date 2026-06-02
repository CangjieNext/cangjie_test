// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %n.cj %diag_json -o %output

interface III {
    static func foo(): Int64 {
        1
    }
}

extend CPointer<Int64> <: III {
}

extend<T> CPointer<T> {
    static public func foo(): Int64 {
        0
    }
}

main() {
    CPointer<Int32>.foo()
}
// ASSERT: scan sema_export_extend_depend_non_export_extend
// ASSERT: scan sema_extend_member_cannot_shadow
