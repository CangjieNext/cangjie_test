// (CJNATIVE and not Windows) EXEC-PIPE-1: %frontendCompiler %cmp_opt %f -o %output 2>& 1 | compare %f

@ObjCMirror[0]
class M {
}

/* SCAN-IN
error: @ObjCMirror requires zero or one 'String' literal argument
 ==> objc_mirror_custom_fqname_bad_type.cj:3:13:
  | 
3 | @ObjCMirror[0]
  |             ^ expected 'String' literal here
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

