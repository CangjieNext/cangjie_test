/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A<T> {
    public static func test(x: T): T {
        x
    }
}

class B<X> <: A<X> {
    public static redef func test<T>(x: X): X {
        x
    }
}

main() {
    0
}
// ASSERT: scan sema_missing_redefined_func
