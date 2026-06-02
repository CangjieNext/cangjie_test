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
    init() {
    }
    init(a: Int64) { // init1
        this(return, return)
    }
    init(a: Int64, b: Int64) { //init2
        this(return)
    }
}

main(): Int64 {
    A(1, 1)
    A(1)
    return 0
}
// ASSERT: scan sema_recursive_constructor_call
