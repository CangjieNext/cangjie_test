// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a constant all-return if reports only the unreachable source branch.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func constantAllReturnIf(value: UInt64): UInt64 {
    const useWide = true
    if (useWide) {
        if (value > 63) {
            return value & 63
        } else {
            return value
        }
    } else {
        if (value > 31) {
            return value & 31
        } else {
            return value
        }
    }
}

main() {
    constantAllReturnIf(1)
}

/* SCAN-IN
warning: unreachable block in 'if' expression
  ==> constant_all_return_if.cj:18:12:
   | 
18 |       } else {
   |  ____________^
19 | |         if (value > 31) {
   | | ...
24 | |     }
   | |_____^ unreachable block in 'if' expression
   | 
   # note: this warning can be suppressed by setting the compiler option `-Woff unused`
*/
