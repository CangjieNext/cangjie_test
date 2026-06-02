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
    var a = 1
    static func test(input!: Int64 = this.a) {
        this.a
    }
}

abstract class C {
    var a = 1
    static func test(input!: Int64 = this.a) {
        this.a
    }
}

main() {
    return 1
}
// ASSERT: scan sema_static_members_cannot_call_members
