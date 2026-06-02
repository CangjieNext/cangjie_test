// LEVEL: 0
// DEPENDENCE: macroBar.cj
// EXEC: %compiler %cmp_macro macroBar.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

internal import pkg2.*

@Bar[\(]
func foo() {
  print("hi foo\n")
}

main() : Int64 {
  foo()
  0
}

/* SCAN
error: unexpected '(' after '\' for macro attribute argument
 ==> callBar2.cj:8:7:
  | 
8 | @Bar[\(]
  |       ^ 
  | 

error: expected declaration, found ']'
 ==> callBar2.cj:8:8:
  | 
8 | @Bar[\(]
  |        ^ expected declaration here
  | 
  # note: only declarations or macro expressions can be used in the top-level

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
