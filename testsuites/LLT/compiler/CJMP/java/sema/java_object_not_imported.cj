// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt -linteroplib.interop 2>& 1 | compare %f


@JavaMirror
class MyClass /* <: JObject */ {}

/* SCAN-IN
error: 'java.lang.JObject' is not imported
 ==> java_object_not_imported.cj:5:7:
  | 
5 | class MyClass /* <: JObject */ {}
  |       ^ 
  |
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

