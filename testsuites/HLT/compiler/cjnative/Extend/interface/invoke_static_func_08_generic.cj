/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output


class A<T>{ }

extend<T> A<T> <: I<T>{
  static public func me<T>(a:T, b: This) { 
    return 0
  }
}

interface I<T>{
  static func foo<T>(){
    1
  }
}

main(): Int64 {
  return 0
}
// ASSERT: scan parse_this_type_not_allow
