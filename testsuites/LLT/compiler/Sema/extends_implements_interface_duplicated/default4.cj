// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %diag_json %f 2>&1 | compare %f

interface A<T> {
    func foo(): T {
        throw Exception()
    }
}

interface B <: A<Int> {}
interface C <: A<String> {}

class D <: B & C {
}

main() {}

// ASSERT: scan sema_inherit_member_type_inconsistent
// ASSERT: scan "Errors": 1
