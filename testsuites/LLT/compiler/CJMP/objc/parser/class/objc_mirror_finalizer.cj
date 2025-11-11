// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f
 
@ObjCMirror
class M {
    ~init()
}
 
/* SCAN-IN
error: @ObjCMirror declaration cannot have finalizer
  ==> objc_mirror_finalizer.cj:11:5:
   | 
11 |     ~init()
   |     ^^^^^^^ 
   | 

error: body of finalizer is missing
  ==> objc_mirror_finalizer.cj:11:12:
   | 
11 |     ~init()
   |            ^ missing finalizer body here
   | 

2 errors generated, 2 errors printed.
*/
