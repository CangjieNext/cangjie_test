// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testb.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt testb.cj -o testb.%middle
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt testb.%middle %n.cj -o %output

import testb.A

class B <: A {
    public override func foo3() {}
}

main() {
}

/* SCAN
error: 'override' function 'foo3' does not have an overridden function in its supertype
  ==> main_err.cj:14:5:
   | 
14 |     public override func foo3() {}
   |     ^ 
   | 

1 error generated, 1 error printed.
*/