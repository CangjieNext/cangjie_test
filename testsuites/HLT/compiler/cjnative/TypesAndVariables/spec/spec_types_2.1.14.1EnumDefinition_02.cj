/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum TimeUnit4 {
    | Year
    | Year(Int32)
    | Year(Float32)
    | Month(Int32, Float32)
    | Month(Int32, Int32)
    | Month(Int32)
    | Day(Int32, Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Day(Float32, Float32)
    | Hour(Int32, Float32, Float32, Float32)
    | Hour(Int32, Int32, Int32, Int32)
    | Hour(Int32, Int32, Int32)
}

main() {
    return 0
}
// ASSERT: scan sema_duplicated_item_in_enum
