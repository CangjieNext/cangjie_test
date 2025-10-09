// (CJNATIVE and not Windows) EXEC-PIPE-1: %frontendCompiler %cmp_opt %f -o %output 2>& 1 | compare %f

@ObjCMirror
class M {
    public let x = 42
    public var xm = 123
}

/* SCAN-IN
error: @ObjCMirror declaration field cannot have initializer
 ==> objc_mirror_field_initializer.cj:5:5:
  | 
5 |     public let x = 42
  |     ^^^^^^^^^^^^^^^^^ 
  | 

error: @ObjCMirror declaration field cannot have initializer
 ==> objc_mirror_field_initializer.cj:6:5:
  | 
6 |     public var xm = 123
  |     ^^^^^^^^^^^^^^^^^^^ 
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

