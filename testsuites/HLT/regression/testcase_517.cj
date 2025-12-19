/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// (CJNATIVE and not iOS) ERRCHECK: %compiler %cmp_opt %f -o %output
// (CJNATIVE) ASSERT: regex-not Internal Compiler Error

// (not CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output
// (not CJNATIVE) ERRCHECK: %run %run_opt %output %run_args

// ASSERT: scan C_Abort


// cjnative: compile time error: undefined reference to `C_Abort'
// cjvm: runtime error: Unsatisfied link: default.C_Abort()void
// but above error message is not official result, just check error hapens and symbol
// do not check the explicit message
foreign func C_Abort(): Unit

main(): Int64 {
  var foo : Int32 = 0

  func bar(): Int32 {
    var baz : Int32 = 0
    if (foo != 45) {
      baz = foo
   if (foo != 45) {
      baz = foo
    }
    return baz
  }

  foo = 1
  if(!(bar() != 0)) {
        }
    return baz
  }

  foo = 1
  if(!(bar() != 1)) {
    unsafe{ C_Abort() }
  }
  print(0)
  return 0
}
