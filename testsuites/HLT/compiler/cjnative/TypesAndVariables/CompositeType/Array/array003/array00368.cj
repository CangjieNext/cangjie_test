/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class A{
  public let a : Int32
  public init(){
    this.a = 5
  }
  public let b = Array<Int32>(5,init())
}

main(){
    let a = A()
    return 1
}
// ASSERT: scan parse_expected_expression
// ASSERT: scan parse_missing_body
