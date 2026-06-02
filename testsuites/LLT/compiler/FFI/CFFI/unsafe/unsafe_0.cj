// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f


main() {
    let f: CFunc<() -> Unit> = { => }
    f()
    return 0
}

/* SCAN
error: unsafe function or native function should be invoked in unsafe context.
 ==> unsafe_0.cj:6:5:
  | 
6 |     f()
  |     ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
