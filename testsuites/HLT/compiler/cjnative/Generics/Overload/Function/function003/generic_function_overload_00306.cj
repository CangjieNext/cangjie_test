/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

func test<X, Y>(a: X, b: Y) {
    print("func_a")
}

func test<X, Y>(a: Y, b: X) {
    print("func_b")
}

main(): Int64 {
    test<Int64, Int64>(1, 1)
    return 0
}
// ASSERT: scan sema_ambiguous_match
