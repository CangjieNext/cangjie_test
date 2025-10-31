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

let (gta, gtb) = (A(), B())
let g: A = A()
let gto = (Some(B()), Option<A>.None)

/* SCAN-IN
error: global variable can not store objects of java interoperability type 'B'
  ==> global_variables.cj:22:1:
   | 
22 | let (gta, gtb) = (A(), B())
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: Also uses java interoperability type 'A'

error: global variable can not store objects of java interoperability type 'A'
  ==> global_variables.cj:23:1:
   | 
23 | let g: A = A()
   | ^^^^^^^^^^^^^^ 
   | 

error: global variable can not store objects of java interoperability type 'A'
  ==> global_variables.cj:24:1:
   | 
24 | let gto = (Some(B()), Option<A>.None)
   | ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: Also uses java interoperability type 'B'

3 errors generated, 3 errors printed.
*/
