// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f


import java.lang.JObject

interface PureCangjie {
   
}

@Java
class JImpl <: PureCangjie {
}

/* SCAN-IN
error: @Java class cannot inherit non-@Java type
  ==> java_impl_non_java_superinterface.cj:11:1:
   | 
11 |   class JImpl <: PureCangjie {
   |  _^
12 | | }
   | |_^
   | 
note: 'PureCangjie' is not a Java-compatible type
  ==> java_impl_non_java_superinterface.cj:11:16:
   | 
11 | class JImpl <: PureCangjie {
   |                ^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

