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
    public func test(x: Int64): Int64 {
        println("a");
        x
    }
}

class B<T> <: A<T> {
    public func test(x: T): T {
        println("b");
        x
    }
}

main() {
    B<Int64>().test(0)
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
