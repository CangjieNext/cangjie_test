/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f



struct R{}

extend R{
  public var a : This 

  public mut prop aa : This{ 
    get(){}
  } 
  
  public func a1(a: This){ 
	
  }

  public func a2() : This{ 
	
  }	
}

main(): Int64 {
    return 0
}
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_this_type_not_allow
