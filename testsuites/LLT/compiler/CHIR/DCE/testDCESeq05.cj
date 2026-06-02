// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

public var var_1665979230477_28: Int32 = Int32(48)

func foo(x: Bool) {
    for (_ in 0..10) {
        if (x) {
            ()
        } else if (match (var_1665979230477_28) {
            case _ =>
                continue;
                var a = 1
                true
        }) {
            ()
        }
    }
}

main() {
    foo(true)
    0
}

/* SCAN
warning: unreachable expression
  ==> testDCESeq05.cj:19:17:
   | 
18 |                 continue;
   |                 ~~~~~~~~ any code following this expression is unreachable
19 |                 var a = 1
   |                 ^^^^^^^^^ unreachable expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

1 warning generated, 1 warning printed.
*/
