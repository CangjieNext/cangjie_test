// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f


@JavaMirror
class M {
    ~init()
}

/* SCAN-IN
error: java-mirrored declaration cannot have finalizer
 ==> java_mirror_finalizer.cj:6:5:
  | 
6 |     ~init()
  |     ^^^^^^^ 
  | 

error: body of finalizer is missing
 ==> java_mirror_finalizer.cj:6:12:
  | 
6 |     ~init()
  |            ^ missing finalizer body here
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

