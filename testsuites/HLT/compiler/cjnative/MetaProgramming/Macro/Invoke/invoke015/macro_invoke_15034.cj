/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt  %f -o %output 2>&1 | compare %f

import define.*

foreign{
@VAR_A(@VAR_D[0] var x = 1) 

@VAR_B @VAR_A(0)

@VAR_C[0](@VAR_B var x = 1) 

@VAR_D[0] @VAR_C[0](0)
}

main(){
    0
}
// ASSERT: scan parse_expected_no_modifier
