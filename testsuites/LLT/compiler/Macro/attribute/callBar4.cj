// DEPENDENCE: macroBar.cj
// EXEC: %compiler %cmp_macro macroBar.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import pkg2.*

@Bar[1234
56789
abcde]
func foo() {
  print("hi foo\n")
}

@Bar[\]

  really_bad_format_

]
func baz() {
  print("hi baz\n")
}

main() : Int64 {
  foo()
  baz()
  var a = @Bar[very_weird
_input_format](
  2 + 3
  )
  if (a != 5) {
    return 1
  }
  0
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

