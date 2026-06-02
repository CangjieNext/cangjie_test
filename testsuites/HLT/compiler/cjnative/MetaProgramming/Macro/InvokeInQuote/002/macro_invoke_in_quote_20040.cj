/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_20040.cj
// EXEC: %compiler %cmp_opt define_20040.cj %macro_opt -o define_20040.%test_suffix
// EXEC: %compiler %cmp_opt %f -o %output 2>&1 | compare %f




package use

import std.ast.*
import define_20040.*

main(){
    var a = quote($(@X[1] var (x,y) = (1,1)))
    a.dump()
    return 0
}
// ASSERT: scan parse_expected_expression
