// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f


import java.lang.*

@Java
open foreign class A1 {
    @ForeignName["fooA1"]
    public open func foo(): Unit
}

@Java
foreign interface I1 {
    func foo(): Unit
}

@Java
foreign interface I2 {
    @ForeignName["fooI2"]
    func foo(): Unit
}

@Java
foreign interface I3 <: I1 & I2 {
    func foo(): Unit
}

/* SCAN-IN

error: Declaration 'foo' has a conflicting @ForeignName annotation
  ==> conflict13.cj:19:5:
   | 
19 |       @ForeignName["fooI2"]
   |  _____^
20 | |     func foo(): Unit
   | |____________^
   | 
note: Other declaration 'foo' doesn't have a @ForeignName
  ==> conflict13.cj:14:10:
   | 
14 |     func foo(): Unit
   |          ^^^ 
   | 
note: While checking declaration 'I3'
  ==> conflict13.cj:24:19:
   | 
24 | foreign interface I3 <: I1 & I2 {
   |                   ^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

