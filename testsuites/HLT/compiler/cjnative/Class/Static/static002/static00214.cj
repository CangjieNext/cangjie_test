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
    public static let a: Int64 = this.i
}

abstract class C {
    public let i: Int64 = 1
    public static let a: Int64 = this.i
}

main() {
    return 0
}
// ASSERT: scan sema_this_or_super_not_allowed_to_initialize_static_member
