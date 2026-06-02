/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {}

func g<T>(a: T): Int32 {
    a = 1
    return 0
}

main(): Int64 {
    return g<A>(A())
}
// ASSERT: scan sema_cannot_assign_to_immutable
// ASSERT: scan sema_cannot_convert_literal
// ASSERT: scan sema_mismatched_types
