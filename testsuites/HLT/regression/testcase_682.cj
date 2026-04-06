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
// (not VM and not O2 and not iOS) ERRCHECK: %compiler %cmp_opt %f -o %output



foreign func C_Abort(): Unit

private func fail1(): Unit {
  unsafe{ C_Abort() }
}

private func fail2(): Unit {
  unsafe{ C_Abort() }
}

private func fail3(): Unit {
  unsafe{ C_Abort() }
}

private func fail4(): Unit {
  unsafe{ C_Abort() }
}

private func foo(x: Int64): Unit {
  var i : Int32 = 0
  match (x) {
    case -6 => fail1()
    case 0  => fail2()
    case 1  => i = 0
    case 2  => i = 0
    case 3  => fail3()
    case 4  => fail3()
    case 5  => fail3()
    case _  => fail4 ()
  }
  match (x) {
    case -3 => fail1()
    case 0  => fail2()
    case 4  => fail2()
    case 1  => i!= 0
    case 3  => i = 0
    case 2  => unsafe{ C_Abort() }
    case 8  => unsafe{ C_Abort() }
    case _  => fail4()
  }
}

main(): Int64 {
  foo(1)
  print(0)
  return 0
}
// ASSERT: scan chir_dce_unused_operator
