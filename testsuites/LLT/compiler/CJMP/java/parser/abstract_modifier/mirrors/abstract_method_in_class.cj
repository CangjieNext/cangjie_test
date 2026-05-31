// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f



import java.lang.*

@Java
foreign class C {
    public abstract func foo(): Unit
}

/* SCAN-IN

error: unexpected modifier 'abstract' on function declaration in class body
 ==> abstract_method_in_class.cj:9:12:
  | 
8 | foreign class C {
  |         ~~~~~ in class
9 |     public abstract func foo(): Unit
  |     ~~~~   ^^^^^^^^ unexpected modifier
  |     |
  |     on function declaration
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

