/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f




interface RA{
  let a : Int32 = 2
}
main(): Int64 {
    var l_a : Array<(Int32,Int32) > = [(4,4)]
    
    l_a[0][0] = RA.a  
    if (l_a[0][0] == Int32(2)) {
        return 0
    }
    return 1
}
// ASSERT: scan parse_unexpected_declaration_in_scope
