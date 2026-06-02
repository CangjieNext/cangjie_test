// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@ObjCMirror
class M {
    private let x: Int64
}

/* SCAN-IN
error: @ObjCMirror declaration cannot have private member
  ==> objc_mirror_private_field.cj:11:5:
   | 
11 |     private let x: Int64
   |     ^^^^^^^^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
