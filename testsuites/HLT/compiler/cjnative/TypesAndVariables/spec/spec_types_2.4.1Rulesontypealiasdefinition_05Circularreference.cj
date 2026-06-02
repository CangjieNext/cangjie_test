/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class GenericClassAp<T, V> {}

type Value = GenericClassAp<Int64, Value>

type Type1 = (Int64) -> Type1

type Type2 = (Int64, Type2)

type Type3 = Type4

type Type4 = Type3

main() {
    return 0
}
// ASSERT: scan sema_not_a_type
// ASSERT: scan sema_undeclared_type_name
// ASSERT: scan sema_typealias_cycle
