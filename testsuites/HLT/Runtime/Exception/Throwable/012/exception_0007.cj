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
    var a = A()
}

main() {
    try {
        A()
    } catch (_: StackOverflowError) {
        return 0
    }
    return 1
}
// ASSERT: scan sema_recursive_constructor_call
