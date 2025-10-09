// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f


@JavaMirror
class M {
    func foo()
}

/* SCAN-IN
error: java-mirrored function must have return type
 ==> java_mirror_method_without_ret_type.cj:6:5:
  | 
6 |     func foo()
  |     ^^^^^^^^^^ java-mirrored function must have return type
  | 

1 error generated, 1 error printed
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

