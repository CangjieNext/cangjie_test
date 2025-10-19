// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %frontendCompiler %dump-parse %cmp_opt %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

import objc.lang.*
import interoplib.objc.*

@ObjCMirror
func foo(s: String): Int64

/* SCAN-IN
error: param type of Objective-C mirror top-level function 'foo' must be Objective-C compatible
  ==> objc_mirror_incompat_argtype.cj:13:13:
   | 
13 | func foo(s: String): Int64
   |             ^^^^^^ 
   | 
*/