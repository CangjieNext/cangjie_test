/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class A {
    A(var a!: Float16 = 1.0, var b!: Int64 = Int64(a = 2.0)) {
    }
}

main() {
    return 1
}
// ASSERT: scan sema_numeric_convert_must_be_numeric
// ASSERT: scan sema_cannot_assign_to_immutable
