/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f


interface I1{
  static func f(){}
  interface I2 { 
    static func f(){}
  }
}

main():Int64{
  I1.f()
  I1.I2.f()
  return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
