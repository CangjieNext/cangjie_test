/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    var a: Int32
    init() {
        this.a = 1
    }
    func test(): Int32 {
        do {
            this()
            return 1
        } while (true)
        return 1
    }
}

main(): Int64 {
    while (true) {
        var a = A()
        a.test()
        return 0
    }
    return 1
}
// ASSERT: scan sema_invalid_this_call_outside_ctor
