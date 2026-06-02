/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

var a: () -> Int64 = (1.02)

main() {
    a()
    return 1
}

class B {
    let b = a()

    func c() {
        a()
    }
}

extend B {
    func d() {
        a()
    }
}
// ASSERT: scan sema_cannot_convert_literal
