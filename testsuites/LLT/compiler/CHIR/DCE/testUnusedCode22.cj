// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

interface I {}

extend Int64 <: I {
    public func test(): Bool {
        match (this) {
            case v: ?Int64 => false
            case v: Int64 => true
            case _ => false
        }
    }
}

main() {
    1.test()
    0
}

/* SCAN
warning: unreachable pattern
  ==> testUnusedCode22.cj:15:18:
   | 
15 |             case v: ?Int64 => false
   |                  ^^^^^^^^^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unreachable pattern
  ==> testUnusedCode22.cj:17:18:
   | 
17 |             case _ => false
   |                  ^ 
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
