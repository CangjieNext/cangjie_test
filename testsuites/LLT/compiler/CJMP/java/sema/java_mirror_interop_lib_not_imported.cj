// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

@JavaMirror
class M {
}

/* SCAN-IN
error: interoplib.interop must be imported to use java interoperability
 ==> java_mirror_interop_lib_not_imported.cj:4:1:
  | 
4 |   class M {
  |  _^
5 | | }
  | |_^
  | 
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

