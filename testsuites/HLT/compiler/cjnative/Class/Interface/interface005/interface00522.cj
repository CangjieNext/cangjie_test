/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f

interface I0{
  func F0():Int32{return 2}
}

interface I1 <: I0{
  override func F0():Int32{return 1}
}

interface I2 <: I1{
  override func F0() 
}
// ASSERT: scan parse_abstract_func_must_have_return_type
