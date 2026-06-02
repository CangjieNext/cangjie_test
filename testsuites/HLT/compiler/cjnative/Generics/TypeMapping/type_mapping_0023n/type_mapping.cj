/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface I<T, V> {
    func test(a: T): Int64 {
        return 0
    }
    func test(a: V): Int64 {
        return 0
    }
}

interface I2<T, V> <: I<T, V> {}

class A <: I2<Int64, Int64> {}

main() {
    var a = A()
    return a.test(1) + a.test(1)
}
// ASSERT: scan sema_interface_member_must_be_implemented
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
