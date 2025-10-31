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

enum E {
    | EA
    | EB((B, A))
    | EC(A)
    | ED(?(A, Int))
}

/* SCAN-IN
error: enum constructor parameter can not store objects of java interoperability type 'A'
  ==> enum_constructor_params.cj:24:10:
   | 
24 |     | EB((B, A))
   |          ^^^^^^ 
   | 
   # note: Also uses java interoperability type 'B'
note: Declared inside non java interoperability enum 'E'
  ==> enum_constructor_params.cj:22:1:
   | 
22 |   enum E {
   |  _^
23 | |     | EA
   | | ...
27 | | }
   | |_^
   | 

error: enum constructor parameter can not store objects of java interoperability type 'A'
  ==> enum_constructor_params.cj:25:10:
   | 
25 |     | EC(A)
   |          ^ 
   | 
note: Declared inside non java interoperability enum 'E'
  ==> enum_constructor_params.cj:22:1:
   | 
22 |   enum E {
   |  _^
23 | |     | EA
   | | ...
27 | | }
   | |_^
   | 

error: enum constructor parameter can not store objects of java interoperability type 'A'
  ==> enum_constructor_params.cj:26:10:
   | 
26 |     | ED(?(A, Int))
   |          ^^^^^^^^^ 
   | 
note: Declared inside non java interoperability enum 'E'
  ==> enum_constructor_params.cj:22:1:
   | 
22 |   enum E {
   |  _^
23 | |     | EA
   | | ...
27 | | }
   | |_^
   | 

3 errors generated, 3 errors printed.
*/
