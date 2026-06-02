/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %f -o %output 


macro package define

import return_one
import std.ast

public macro M(input:Tokens){
    return quote($(@VAR_A(@VAR_C[0](0))))
     + quote(+) + quote($(@VAR_B @VAR_D[0] var x = 1))
     + quote(+) + quote($(@VAR_C[0](@VAR_A(0))))
     + quote(+) + quote($(@VAR_D[0] @VAR_B var x = 1))
     + quote(-4)
}
// ASSERT: scan parse_nl_warning
// ASSERT: scan parse_expected_expression
