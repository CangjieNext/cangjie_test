// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.*

@JavaMirror
open class A1 {
    @ForeignName["fooA1"]
    public open func foo(): Unit
}

@JavaMirror
interface I1 {
    func foo(): Unit
}

@JavaMirror
interface I2 {
    @ForeignName["fooI2"]
    func foo(): Unit
}

@JavaMirror
class A2 <: I1 & I2 {
    @ForeignName["fooA2"]
    public func foo(): Unit
}

/* SCAN-IN
error: Declaration 'foo' has a conflicting @ForeignName annotation
  ==> conflict23.cj:19:5:
   | 
19 |       @ForeignName["fooI2"]
   |  _____^
20 | |     func foo(): Unit
   | |____________^
   | 
note: Other declaration 'foo' doesn't have a @ForeignName
  ==> conflict23.cj:14:10:
   | 
14 |     func foo(): Unit
   |          ^^^ 
   | 
note: While checking declaration 'A2'
  ==> conflict23.cj:24:7:
   | 
24 | class A2 <: I1 & I2 {
   |       ^^ 
   | 

error: @ForeignName could not appear on overridden declaration
  ==> conflict23.cj:25:5:
   | 
25 |       @ForeignName["fooA2"]
   |  _____^
26 | |     public func foo(): Unit
   | |___________________^
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

