// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@ObjC
foreign class M {
    func foo(): Unit {}
}

/* SCAN-IN
error: @ObjC foreign type method 'foo' cannot have body
  ==> objc_mirror_method_with_body.cj:11:22:
   | 
11 |     func foo(): Unit {}
   |                      ^^ 
   | 

1 error generated, 1 error printed.
*/
