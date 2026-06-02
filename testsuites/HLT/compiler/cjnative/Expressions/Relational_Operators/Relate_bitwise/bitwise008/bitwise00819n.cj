/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f



// class/interface/struct直接使用位操作符
main(): Int64 {
    1^ ;  
    2<<;   
    1>> ;    
    3& ;   
    5| ; 
}
// ASSERT: scan parse_expected_expression
