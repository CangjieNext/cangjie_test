/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output
// ASSERT: scan sema_multiple_constructor_in_enum

enum EE<T> {
    A00(T) | B00(T) | C00
}

enum EEE {
    B00(String)
}

main(): Int64 {
    const a2 = B00("123")

    return 0
}
