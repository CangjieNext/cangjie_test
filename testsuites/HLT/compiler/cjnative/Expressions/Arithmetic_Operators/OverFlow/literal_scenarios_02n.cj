/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

func foo<T>(a: T, b!: Int8 = -129): Int8 {
    return 256
}

main(): Int64 {
    foo<Int64>(3)
    return 0
}
// ASSERT: scan sema_exceed_num_value_range
