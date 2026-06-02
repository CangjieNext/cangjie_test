// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args

public func foo(a: Int64) {
    0
}

public func foo1(a!: Int64 = 2) {
    0
}

public func foo2(_: Int64) {
    0
}

main() {
    var _ = 1
    foo(1)
    foo1(a: 2)
    foo2(3)
    return 0
}

/* SCAN
warning: unused variable:'a'
 ==> testUnusedVariable02.cj:4:17:
  | 
4 | public func foo(a: Int64) {
  |                 ^ unused variable
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused variable:'a'
 ==> testUnusedVariable02.cj:8:18:
  | 
8 | public func foo1(a!: Int64 = 2) {
  |                  ^ unused variable
  | 
  # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
