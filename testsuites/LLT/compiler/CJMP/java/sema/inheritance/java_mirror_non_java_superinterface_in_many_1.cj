// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f


import java.lang.JObject

@Java
open foreign class JMirrorSuperClass {}

interface PureCangjie {
}

@Java
foreign class JMirror <: JMirrorSuperClass & PureCangjie {
}

/* SCAN-IN
error: @Java foreign type cannot inherit non-@Java type
  ==> java_mirror_non_java_superinterface_in_many_1.cj:13:1:
   | 
13 |   foreign class JMirror <: JMirrorSuperClass & PureCangjie {
   |  _^
14 | | }
   | |_^
   | 
note: 'PureCangjie' is not a Java-compatible type
  ==> java_mirror_non_java_superinterface_in_many_1.cj:13:46:
   | 
13 | foreign class JMirror <: JMirrorSuperClass & PureCangjie {
   |                                              ^^^^^^^^^^^ 
   | 

1 error generated, 1 error printed.
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

