/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f


enum A{
  aaa | bbb(Int32)
  public mut func a(){} 

  public mut prop b: Int32 { 
    mut get(){ 
      return Int32(1)
    }
  }
}
// ASSERT: scan parse_illegal_modifier_in_scope
// ASSERT: scan parse_expected_no_modifier
