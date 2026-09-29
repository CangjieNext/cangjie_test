// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %diag_json %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import java.lang.*

class MyClass {}

@Java
foreign class M {
    public func foo1(a: JArray<MyClass>): Unit
    public func foo2(): JArray<MyClass>
}

/* SCAN-IN
error: JArray can only be used with Java-compatible types
  ==> java_mirror_jarray_illegal_type_argument.cj:15:32:
   | 
15 |     public func foo1(a: JArray<MyClass>): Unit
   |                                ^^^^^^^ 
   | 

error: JArray can only be used with Java-compatible types
  ==> java_mirror_jarray_illegal_type_argument.cj:16:32:
   | 
16 |     public func foo2(): JArray<MyClass>
   |                                ^^^^^^^ 
   | 
*/
