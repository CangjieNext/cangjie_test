/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class B {
    public let i: Int64 = 1
    public static let a: Int64 = i
}

abstract class C {
    public let i: Int64 = 1
    public static let a: Int64 = i
}

main() {
    return 1
}
// ASSERT: scan sema_static_variable_cannot_access_non_static_member
// ASSERT: scan sema_used_before_initialization
