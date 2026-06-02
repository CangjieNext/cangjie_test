// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) EXEC-PIPE-0: %run %run_opt %output %run_args

private class foo {
    var a = 1
    mut prop b: Int64 {
        get() {
            0
        }
        set(v) {
            a = v
        }
    }
}

main() {
    return 0
}

/* SCAN
warning: unused function:'get'
  ==> testUnusedFunction12.cj:13:9:
   | 
13 |           get() {
   |  _________^
14 | |             0
15 | |         }
   | |_________^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

warning: unused function:'set'
  ==> testUnusedFunction12.cj:16:9:
   | 
16 |           set(v) {
   |  _________^
17 | |             a = v
18 | |         }
   | |_________^ unused function
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`

2 warnings generated, 2 warnings printed.
*/
