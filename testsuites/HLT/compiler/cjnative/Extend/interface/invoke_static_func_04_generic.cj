/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output




extend<T> Foo<T> <: I<T>{
  public static mut func f() { 
    i += 1
  }
}

extend<T> Foo<T> <: I<Int32>{
  public static mut func f() { 
    i += 1
  }
}

main(): Int64 {
  return 1
}

interface I<T>{
  static func foo(){
    1
  }
}

struct Foo<T> {
  public var i = 0
}
// ASSERT: scan parse_conflict_modifier
