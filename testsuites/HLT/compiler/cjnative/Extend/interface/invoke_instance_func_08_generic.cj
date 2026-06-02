/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output


interface I<T>{
	func foo(){
	  return 1
	}
}

class A<T>{

}

extend<T> A<T> <: I<Int32>{
  public func me<T>(a: This) { 
    return 0
  }
}

main(): Int64 {
  return 0
}

extend<T> A<T> <: I<T>{
  public func me<T>(a: This) { 
    return 0
  }
}
// ASSERT: scan parse_this_type_not_allow
