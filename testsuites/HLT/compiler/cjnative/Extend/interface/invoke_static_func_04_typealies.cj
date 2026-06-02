/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

extend TFoo <: I{
  public static mut func f() { 
    i += 1
  }
}

extend Foo <: TI{
  public static mut func f() { 
    i += 1
  }
}


main(): Int64 {
  return 1
}

interface I{
  static func foo(){
    1
  }
}

struct Foo {
  public var i = 0
}

type TFoo = Foo
type TI = I
// ASSERT: scan parse_conflict_modifier
