/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output


enum TimeUnit<T>
    where T <:  {  
    Year(T)
}

main(): Int64 {
    var i1: Int32 = 4
    var time = TimeUnit.Year(i1)
    return 0
}
// ASSERT: scan parse_expected_type
