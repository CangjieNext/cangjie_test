// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %frontendCompiler %dump-parse %cmp_opt %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

import objc.lang.*

@ObjC
const foreign func foo(): Int64

/* SCAN-IN
error: 'foreign' and 'const' modifiers conflict on function declaration
  ==> objc_mirror_const.cj:12:7:
   | 
12 | const foreign func foo(): Int64
   | ~~~~~ ^^^^^^^ ~~~~ on function declaration
   | |     |
   | |     unexpected modifier
   | |
   | because it is conflicted with this
   | 

error: @ObjC top-level foreign function 'foo' cannot be const
  ==> objc_mirror_const.cj:12:15:
   | 
12 | const foreign func foo(): Int64
   |               ^ 
   | 

2 errors generated, 2 errors printed.
*/