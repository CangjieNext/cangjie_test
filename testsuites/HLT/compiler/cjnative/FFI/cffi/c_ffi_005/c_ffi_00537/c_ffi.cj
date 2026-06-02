/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

import std.collection.*

var cptr: CPointer<CType> = CPointer<CType>()
var hmp: HashMap<CType, CType> = HashMap<CType, CType>()

main() {}

// ASSERT: scan sema_generic_type_argument_not_match_constraint
