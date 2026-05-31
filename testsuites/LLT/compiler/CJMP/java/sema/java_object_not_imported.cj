// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt -ljava.internal 2>& 1 | compare %f


@Java
foreign class MyClass /* <: JObject */ {}

/* SCAN-IN
error: 'java.lang.JObject' is not imported
 ==> java_object_not_imported.cj:5:15:
  | 
5 | foreign class MyClass /* <: JObject */ {}
  |               ^ 
  | 

error: java.lang must be imported to use Java interoperability
 ==> java_object_not_imported.cj:5:1:
  | 
5 | foreign class MyClass /* <: JObject */ {}
  | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
  | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

