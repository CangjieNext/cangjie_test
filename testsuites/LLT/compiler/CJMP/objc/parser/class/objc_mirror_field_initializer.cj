// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %frontendCompiler %cmp_opt %f -o %output 2>& 1 | compare %f

@ObjC
foreign class M {
    public let x = 42
    public var xm = 123
}

/* SCAN-IN
error: @ObjC foreign type field declaration cannot have initializer
  ==> objc_mirror_field_initializer.cj:11:5:
   | 
11 |     public let x = 42
   |     ^^^^^^^^^^^^^^^^^ 
   | 

error: @ObjC foreign type field declaration cannot have initializer
  ==> objc_mirror_field_initializer.cj:12:5:
   | 
12 |     public var xm = 123
   |     ^^^^^^^^^^^^^^^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/
