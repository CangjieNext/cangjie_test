/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A {}

interface B {}

class C <: A & B {}

func test(a: A): Int64 {
    return 1
}

func test(a: B): Int64 {
    return 2
}

main() {
    test(C())
    return 1
}
// ASSERT: scan sema_ambiguous_match
