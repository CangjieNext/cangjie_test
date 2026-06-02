/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main(): Int64 {
    let arr : Array<Int64> =[1,2,3,4,5]
    let b = arr[..:2] 
    let b1 = arr[0..:2]  
    let b2 = arr[..5:2] 
    return 2
}
// ASSERT: scan parse_unexpected_colon_in_range
