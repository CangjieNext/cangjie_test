/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define_func.cj
// EXEC: %compiler %cmp_macro define_func.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define_func.*

interface X{
@VAR_A(@VAR_A(0))

@VAR_B @VAR_B var x = 1

@VAR_C[0](@VAR_C[0](0))

@VAR_D[0] @VAR_D[0] var x = 1
}

main(){
    0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
