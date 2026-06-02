/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface Father {
    func foo(a: Int8): Int64 {
        return 1
    }
}

interface Child <: Father {
    static func foo(a: Int16): Int64 {
        return 1
    }
}

main() {
    return 0
}
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
