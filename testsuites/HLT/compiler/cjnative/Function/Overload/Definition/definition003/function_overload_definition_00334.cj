/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface GrandFather {
    func foo(a: Int8): Int64 {
        return 1
    }
}

interface Father <: GrandFather {
    func foo(a: Int8): Int64 {
        return 1
    }
}

class Child <: Father {
    public static func foo(a: Int16): Int64 {
        return 2
    }
}

main() {
    return 0
}
// ASSERT: scan sema_static_and_non_static_member_cannot_have_same_name
