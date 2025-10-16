/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// LEVEL: 0
// (not VM and O2) EXEC: %compiler %cmp_opt %f -o %output
// (not VM and O2) RUN-EXEC: %run %run_opt %output %run_args
// (not VM and not O2) ERRCHECK: %compiler %cmp_opt %f -o %output



foreign func C_Abort(): Unit

private func get_kind(v: Int32): Int32 {
  var k : Int32 = v
  return k
}

private func some_call(): Int32 {
  return 0
}

private func example(arg: Int32): Unit {
  var tmp : Int32
  var kind : Int32 = get_kind(arg)
  if (kind == 9 || kind == 10 || kind == 5) {
    if (some_call() == 0) {
      if (kind == 9 || kind == 10) {
        tmp = arg
     9} else {
        unsafe{ C_Abort() }
      }
    }
  }
}

main(): Int64 {
  example(10)
  print(0)
  return 0
}
// ASSERT: scan chir_dce_unused_variable
// ASSERT: scan chir_dce_unused_expression
