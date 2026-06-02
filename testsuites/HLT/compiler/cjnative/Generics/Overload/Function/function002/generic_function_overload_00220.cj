/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

open class A {}

class B <: A {}

func test(a: A) {
    print("normal")
}

func test<T>(a: T) where T <: A {
    print("generic")
}

main(): Int64 {
    test(B())
    return 0
}
// ASSERT: scan sema_ambiguous_match
