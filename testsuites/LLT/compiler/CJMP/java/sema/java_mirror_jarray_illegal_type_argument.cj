// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f


import java.lang.*


class MyClass {}

@Java
foreign class M {
    public func foo1(a: JArray<MyClass>): Unit
    public func foo2(): JArray<MyClass>
}

/* SCAN-IN
error: parameter type of @Java function must be Java-compatible
  ==> java_mirror_jarray_illegal_type_argument.cj:11:22:
   | 
11 |     public func foo1(a: JArray<MyClass>): Unit
   |                      ^^^^^^^^^^^^^^^^^^ 
   | 

error: return type 'Class-JArray<Class-MyClass>' of function inside @Java foreign type must be Java-compatible
  ==> java_mirror_jarray_illegal_type_argument.cj:12:25:
   | 
12 |     public func foo2(): JArray<MyClass>
   |                         ^^^^^^^^^^^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

