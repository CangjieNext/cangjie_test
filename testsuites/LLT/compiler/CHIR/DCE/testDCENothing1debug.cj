// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-PIPE: %compiler %cmp_opt -g %f -o %output 2>&1 | compare %f

public func foo(a: Nothing) {a}
func goo(a: Nothing) {a}

main() {
    return 0
}

/* SCAN-IN
warning: unused function:'foo'
 ==> testDCENothing1debug.cj:8:1:
  | 
8 | public func foo(a: Nothing) {a}
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ unused function
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable function 
 ==> testDCENothing1debug.cj:8:17:
  | 
8 | public func foo(a: Nothing) {a}
  |                 ^ function with parameter of nothing type will never be executed
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused function:'goo'
 ==> testDCENothing1debug.cj:9:1:
  | 
9 | func goo(a: Nothing) {a}
  | ^^^^^^^^^^^^^^^^^^^^^^^^ unused function
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable function 
 ==> testDCENothing1debug.cj:9:10:
  | 
9 | func goo(a: Nothing) {a}
  |          ^ function with parameter of nothing type will never be executed
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

4 warnings generated, 4 warnings printed.
*/