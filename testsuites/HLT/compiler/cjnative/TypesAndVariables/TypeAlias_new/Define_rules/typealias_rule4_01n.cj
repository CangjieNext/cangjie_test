/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

class classA<T>{
  public var a:T
  public init(i:T){
    a=i
  }
}

class B{
  public func a(a:Int64):Int64{a}
}

type A<T> = classA<T> where T<:B 

main(): Int64 {
  var a : A<B> = classA<B>(B())
  if(a.a.a(1)==1){
    return 0
  }else{
    return 1
  }
}
// ASSERT: scan parse_expected_character
