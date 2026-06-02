/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct R1 {
    public let other: R1
}

struct R3 {
    public let other: R4
}

struct R4 {
    public let other: R3
}

main() {
    return 0
}
// ASSERT: scan sema_value_type_recursive
// ASSERT: scan sema_class_uninitialized_field
