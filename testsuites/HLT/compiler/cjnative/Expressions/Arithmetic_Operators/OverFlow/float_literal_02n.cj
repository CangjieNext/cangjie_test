/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f 2>&1 |compare %f

main(): Int64 {
    var lit01 = -2f-1_      
    var lit02 = 2_EE1_        
    var lit03 = e2_
    var lit04 = 0x1.1_     
    var lit06 = 0x.2        
    var lit07 = 0xp2        

    if (lit03 != 100.0) {
        return 1
    }
    return 0
}
// ASSERT: scan lex_illegal_float_suffix
// ASSERT: scan lex_expected_digit
// ASSERT: scan lex_expected_exponent_part
