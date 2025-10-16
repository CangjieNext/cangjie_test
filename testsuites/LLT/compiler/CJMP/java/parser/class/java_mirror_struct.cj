// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f


@JavaMirror
struct S {

}

/* SCAN-IN
error: unexpected annotation '@JavaMirror' on struct
 ==> java_mirror_struct.cj:4:1:
  | 
4 | @JavaMirror
  | ^^^^^^^^^^^ unexpected annotation here
5 | struct S {
  | ~~~~~~ on struct
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

