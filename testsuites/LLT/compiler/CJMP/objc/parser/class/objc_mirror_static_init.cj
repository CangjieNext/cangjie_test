// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@ObjC
foreign class M {
    @ForeignName["initialize"]
    static init()
}

/* SCAN-IN
error: @ObjC foreign type cannot declare a static initializer
  ==> objc_mirror_static_init.cj:12:5:
   | 
12 |     static init()
   |     ^^^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
