// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC:%frontendCompiler %cmp_opt_chir2hlir %verbose_opt %n.cj

@C
func C2CJ_Func(a1:Int32, a2:Int64, a3:Int32, a4:Int64, a5:Int32, a6:Int64, a7:Int32, a8:Int64, a9:Int32, a10:Int64): Int64 {
  return  a2 + a4 + a6 + a8 + a10
}

foreign func C_Func(a1:Int32, a2:Int64, a3:Int32, a4:Int64, a5:Int32, a6:Int64, a7:Int32, a8:Int64, a9:Int32, a10:Int64): Int64

main():Int64 {
  var ret = unsafe{ C_Func(1,2,3,4,5,6,7,8,9,10)}
  if (ret == 3) {
    return 0
  }
  return 1
}

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
