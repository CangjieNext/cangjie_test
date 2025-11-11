// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %frontendCompiler %cmp_opt %f -o %output 2>& 1 | compare %f
 
@ObjCMirror["fqname", "anything else"]
class M {
}

/* SCAN-IN
error: @ObjCMirror requires zero or one 'String' literal argument
 ==> objc_mirror_custom_fqname_many_types.cj:9:1:
  | 
9 | @ObjCMirror["fqname", "anything else"]
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected single 'String' literal for @ObjCMirror here
  | 

1 error generated, 1 error printed.
*/
