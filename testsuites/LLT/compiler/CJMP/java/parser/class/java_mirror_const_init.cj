// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f


@JavaMirror
class M {
    const init()
}

/* SCAN-IN
error: java-mirrored declaration cannot have const member
 ==> java_mirror_const_init.cj:6:5:
  | 
6 |     const init()
  |     ^^^^^^^^^^^^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

