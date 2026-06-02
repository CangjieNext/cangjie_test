/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %f 2>&1 | compare %f


main() {
  var b = R(a: 6)
  b.c(7)
  return Int64(b.a - 7)
}

struct R{
  public var a : Int32 = 8

  public func c(b : Int32) : Int32{
	  mut func cc(){ 
      a = b
    }
	  return 0
	}
}
// ASSERT: scan parse_illegal_modifier_in_scope
