// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.*

@JavaMirror
public open class A {
    public init()
}

@JavaMirror
public open class B {
    public init()
}

public class C {
    C(let x: A) {}
}

/* SCAN-IN
error: member variable can not store objects of java interoperability type 'A'
  ==> member_variable_in_primary_ctor.cj:23:7:
   | 
23 |     C(let x: A) {}
   |       ^^^^^^^^ 
   | 
note: Declared inside non java interoperability class 'C'
  ==> member_variable_in_primary_ctor.cj:22:1:
   | 
22 |   public class C {
   |  _^
23 | |     C(let x: A) {}
24 | | }
   | |_^
   | 

1 error generated, 1 error printed.
*/
