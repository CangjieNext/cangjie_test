/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



main(){
    let range9 = 0..10: 0  
    let range10 = 0..=10: 0  
    let range13 = ..10  
    let range14 = 1..  
    let range15 = ..  
    return 0
}
// ASSERT: scan parse_expected_expression
