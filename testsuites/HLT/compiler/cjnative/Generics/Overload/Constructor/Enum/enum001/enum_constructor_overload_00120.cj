/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum B<T> {
    a(Bool)
}

enum A<T> {
    a(T)
}

main(): Int64 {
    var i: B<Int64> = a<Int64>(1)
    var j: A<Int64> = a<Int64>(true)
    return 1
}
// ASSERT: scan sema_enum_constructor_type_not_match
// ASSERT: scan sema_mismatched_types
