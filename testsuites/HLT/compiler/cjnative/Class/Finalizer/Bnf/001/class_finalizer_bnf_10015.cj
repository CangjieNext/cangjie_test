/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

var x = A()

class A {
    public let a: A = this
    ~init() {
        a
    }
}

func test() {
    var a = A()
}

main() {
    test()
    return 0
}
// ASSERT: scan sema_this_or_super_not_allowed_to_initialize_non_static_member
