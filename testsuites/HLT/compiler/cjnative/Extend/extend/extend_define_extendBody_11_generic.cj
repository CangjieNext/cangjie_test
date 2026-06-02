/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f -o %output


class A<T>{
  public var a = 0	
}

extend<T> A<T> {
  public func foo1<X>(a: X):Y
}
    
main(): Int64 {
    return A().foo1()
}
// ASSERT: scan parse_missing_body
