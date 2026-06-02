/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class cls{
  static var a

  static init(){
    a = 1
  }
}

main(): Int64 {

  if(clas.a == 1){
    return 0
  }
  return 1
}
// ASSERT: scan parse_expected_one_of_type_or_initializer
