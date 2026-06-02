// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix 2>&1 | compare %f
// ASSERT: scan success

@C
func f(): Unit{
    println("success")
}
@C
public struct implicitExceptionFuncs {
  let func4 =   f
}
main(): Int64 {
   var x = implicitExceptionFuncs()
   unsafe { x.func4() }
0
}
