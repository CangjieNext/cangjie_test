// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that type-pattern reachability preserves tuple tail columns.

// EXEC-PIPE: %compiler %cmp_opt %compile_lib_opt %f -o %output -Woff=unused-main 2>&1 | compare %f

abstract sealed class A {}

class B <: A {}

class C <: A {}

main() {
    let pair: (A, A) = (C(), C())
    match (pair) {
        case (_, _: B) => 0
        case (_: C, _: C) => 1
        case (_: C, _: B) => 2
        case _ => 3
    }
}

/* SCAN
warning: unreachable pattern
  ==> tuple_type_pattern_3210.cj:22:14:
   | 
22 |         case (_: C, _: B) => 2
   |              ^^^^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
