// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@ObjCMirror
class M {
    init() {}
}

/* SCAN-IN
error: @ObjCMirror declaration constructor cannot have body
 ==> objc_mirror_init_ctor_with_body.cj:5:12:
  | 
5 |     init() {}
  |            ^ @ObjCMirror declaration constructor cannot have body
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

