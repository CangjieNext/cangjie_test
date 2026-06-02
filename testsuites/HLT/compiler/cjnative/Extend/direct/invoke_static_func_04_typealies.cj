/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

struct Foo {
  public var i: Int64 = 0
}

type TT = A
extend TT{
  public static mut func f() { 
    i += 1
  }
}

main(): Int64 {
  return 1
}
// ASSERT: scan parse_conflict_modifier
