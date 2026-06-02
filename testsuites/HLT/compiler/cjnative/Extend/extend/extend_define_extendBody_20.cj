/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f -o %output 2>&1 | compare %f

interface I {}

extend Int64 <: I{ 
  var a: Int64 = 0
  let b: Int64 = 0
}

main(): Int64{
  return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
