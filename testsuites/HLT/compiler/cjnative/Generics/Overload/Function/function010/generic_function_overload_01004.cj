/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

func f<X>(a: X, b!: Int64 = 1): Int64 {
    0
} //f1

func f<X>(a: X): Int64 {
    1
} //f2

main() {
    f(1)
    1
}
// ASSERT: scan sema_ambiguous_match
