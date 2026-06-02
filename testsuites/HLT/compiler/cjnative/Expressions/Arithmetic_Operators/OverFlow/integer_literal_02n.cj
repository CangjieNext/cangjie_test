/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

main(): Int64 {
    var lit01 = b_0001_1000_        
    let lit02 = 2o30                
    let lit03 = _0b0_001_1000        
    let lit04 = 0C18        
    let lit05 = 0x_18   
    var lit06 = -_0     
    if (lit01 == 24 && lit02 == 1 && lit03 == 1 && lit04 == -1 && lit05 == 0) {
        return 0
    }
    return 1
}
// ASSERT: scan lex_unknown_suffix
// ASSERT: scan lex_unexpected_digit
// ASSERT: scan lex_expected_digit
