/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<X> {
    public func test(x: X): X {
        println("a");
        x
    }
    public func test(x: Int64): Int64 {
        println("b");
        0
    }
}

main() {
    A<Int64>()
}
// (not iOS) ASSERT: scan sema_unexpected_return_type_for_entry
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
