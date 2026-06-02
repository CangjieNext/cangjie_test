// EXEC-PIPE-1: %compiler %ulimit-error %noColor %cmp_opt_chir2hlir %verbose_opt %f -o %output 2>&1 | compare %f

@C
struct Data {
    var m1: CType
    var m2: CType

    init(m1: CType, m2: CType) {
        this.m1 = m1
        this.m2 = m2
    }
}

main() {}

/* SCAN-IN
error: member variable 'm1' of struct 'Data' with @C must be instantiated with CType
 ==> member_0.cj:5:9:
  | 
5 |     var m1: CType
  |         ^^^^^^^^^ 
  | 

error: member variable 'm2' of struct 'Data' with @C must be instantiated with CType
 ==> member_0.cj:6:9:
  | 
6 |     var m2: CType
  |         ^^^^^^^^^ 
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
