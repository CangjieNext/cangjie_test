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
    static var sv: A = A()
    let l = A()

    var vt: (B, (Int, A, Int)) = (B(), (2, A(), 3))

    static let slo = Some(Some(A()))
}

/* SCAN-IN
error: member variable can not store objects of java interoperability type 'A'
  ==> class_member_variables.cj:23:5:
   | 
23 |     static var sv: A = A()
   |     ^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: Declared inside non java interoperability class 'C'
  ==> class_member_variables.cj:22:1:
   | 
22 |   public class C {
   |  _^
23 | |     static var sv: A = A()
   | | ...
29 | | }
   | |_^
   | 

error: member variable can not store objects of java interoperability type 'A'
  ==> class_member_variables.cj:24:5:
   | 
24 |     let l = A()
   |     ^^^^^^^^^^^ 
   | 
note: Declared inside non java interoperability class 'C'
  ==> class_member_variables.cj:22:1:
   | 
22 |   public class C {
   |  _^
23 | |     static var sv: A = A()
   | | ...
29 | | }
   | |_^
   | 

error: member variable can not store objects of java interoperability type 'A'
  ==> class_member_variables.cj:26:5:
   | 
26 |     var vt: (B, (Int, A, Int)) = (B(), (2, A(), 3))
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
   # note: Also uses java interoperability type 'B'
note: Declared inside non java interoperability class 'C'
  ==> class_member_variables.cj:22:1:
   | 
22 |   public class C {
   |  _^
23 | |     static var sv: A = A()
   | | ...
29 | | }
   | |_^
   | 

error: member variable can not store objects of java interoperability type 'A'
  ==> class_member_variables.cj:28:5:
   | 
28 |     static let slo = Some(Some(A()))
   |     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
   | 
note: Declared inside non java interoperability class 'C'
  ==> class_member_variables.cj:22:1:
   | 
22 |   public class C {
   |  _^
23 | |     static var sv: A = A()
   | | ...
29 | | }
   | |_^
   | 

4 errors generated, 4 errors printed.
*/
