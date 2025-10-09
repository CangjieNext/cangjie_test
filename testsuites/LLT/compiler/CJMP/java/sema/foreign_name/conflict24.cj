// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.*

@JavaMirror
interface I1 {
    @ForeignName["fooI1"]
    func foo(): Unit
}

@JavaMirror
interface I2 {
    @ForeignName["fooI2"]
    func foo(): Unit
}

@JavaMirror
open class A2 <: I1 {
    public open func foo(): Unit
}

@JavaMirror
open class A3 <: A2 & I2 {
}

/* SCAN-IN
error: Declaration 'foo' has a conflicting @ForeignName annotation
  ==> conflict24.cj:14:5:
   | 
14 |       @ForeignName["fooI2"]
   |  _____^
15 | |     func foo(): Unit
   | |____________^
   | 
note: Other declaration 'foo' has a different derived @ForeignName 'fooI1'
  ==> conflict24.cj:20:22:
   | 
20 |     public open func foo(): Unit
   |                      ^^^ 
   | 
note: While checking declaration 'A3'
  ==> conflict24.cj:24:12:
   | 
24 | open class A3 <: A2 & I2 {
   |            ^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

