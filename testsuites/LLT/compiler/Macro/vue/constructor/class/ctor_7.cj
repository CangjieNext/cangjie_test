// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import view.*

class te2 {
    var fi: Int64
    @M[1 + 2]
    private init(name: Int64) {
        fi = name
    }
}

main(): Int64 {
    te2(5)
    return 0
}

/* SCAN
error: no matching constructor for call 'te2'
  ==> ctor_7.cj:16:5:
   | 
16 |     te2(5)
   |     ^ 
   | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

