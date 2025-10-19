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

public struct S {
    static let sl: A = A()
    var v: A = A()

    static var svt: (A, Int) = (A(), 10)

    let lo: Option<A> = None
}

/* SCAN-IN
error: member variable can not store objects of java interoperability type 'A'
  ==> struct_member_variables.cj:23:5:
   | 
23 |     static let sl: A = A()
   |     ^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: Declared inside non java interoperability struct 'S'
  ==> struct_member_variables.cj:22:1:
   | 
22 |   public struct S {
   |  _^
23 | |     static let sl: A = A()
   | | ...
29 | | }
   | |_^
   | 

error: member variable can not store objects of java interoperability type 'A'
  ==> struct_member_variables.cj:24:5:
   | 
24 |     var v: A = A()
   |     ^^^^^^^^^^^^^^ 
   | 
note: Declared inside non java interoperability struct 'S'
  ==> struct_member_variables.cj:22:1:
   | 
22 |   public struct S {
   |  _^
23 | |     static let sl: A = A()
   | | ...
29 | | }
   | |_^
   | 

error: member variable can not store objects of java interoperability type 'A'
  ==> struct_member_variables.cj:26:5:
   | 
26 |     static var svt: (A, Int) = (A(), 10)
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: Declared inside non java interoperability struct 'S'
  ==> struct_member_variables.cj:22:1:
   | 
22 |   public struct S {
   |  _^
23 | |     static let sl: A = A()
   | | ...
29 | | }
   | |_^
   | 

error: member variable can not store objects of java interoperability type 'A'
  ==> struct_member_variables.cj:28:5:
   | 
28 |     let lo: Option<A> = None
   |     ^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: Declared inside non java interoperability struct 'S'
  ==> struct_member_variables.cj:22:1:
   | 
22 |   public struct S {
   |  _^
23 | |     static let sl: A = A()
   | | ...
29 | | }
   | |_^
   | 

4 errors generated, 4 errors printed.
*/
