/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_used_before_initialization

func foo() {
    var a: Int32
    do {
        if (true) {
            break
        }
        a = 1
    } while (a == 0)
    a = 2
    return a
}

main() {
    var a = foo()
    return a - 2
}
