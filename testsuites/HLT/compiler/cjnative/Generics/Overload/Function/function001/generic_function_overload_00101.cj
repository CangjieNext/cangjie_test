/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A<T> {
    public init(a: T) {
        print("A_first")
    }
    public init(a: Int64) {
        print("A_second")
    }
}

func test(a: A<Int64>) {}

main(): Int64 {
    return 1
}
// ASSERT: scan sema_generic_instantiation_causes_ambiguous_functions
