/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_10022.cj
// EXEC: %compiler %cmp_macro define_10022.cj
// EXEC: %compiler %cmp_opt  %f -o %output 2>&1 | compare %f


package use

import std.ast.*
import define_10022.*


main(){
    return @M let x : abc - 2
}
// ASSERT: scan parse_unrecognized_token_after_macro_node
