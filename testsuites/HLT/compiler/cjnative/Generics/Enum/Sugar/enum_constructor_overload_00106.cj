/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

enum A<X, Y> {
    a
    | a(X)
    | a(Y)
}

main(): Int64 {
    var i = A.a
    return 1
}
// ASSERT: scan sema_duplicated_item_in_enum
// ASSERT: scan sema_generic_type_without_type_argument
