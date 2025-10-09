// (CJNATIVE and not Windows) EXEC-PIPE-1: %frontendCompiler %dump-parse %cmp_opt %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f


@JavaMirror["fqname", "anything else"]
class M {
    init()
}

/* SCAN-IN
error: @JavaMirror requires zero or one 'String' literal argument
 ==> java_mirror_custom_fqname_many_types.cj:4:1:
  | 
4 | @JavaMirror["fqname", "anything else"]
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ expected single 'String' literal for @JavaMirror here
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

