/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test<T>(a: T) {
    print("a")
}

func test<X>(a: X) {
    print("b")
}

main(): Int64 {
    test<Int64>(1)
    return 1
}
// ASSERT: scan sema_overload_conflicts
// ASSERT: scan sema_ambiguous_match
