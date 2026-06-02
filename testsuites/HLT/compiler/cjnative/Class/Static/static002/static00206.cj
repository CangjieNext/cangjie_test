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
    init() {}
    static func test() {
        this()
    }
}

abstract class C {
    init() {}
    static func test() {
        this()
    }
}

main() {
    B.test()
    C.test()
    return 1
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
