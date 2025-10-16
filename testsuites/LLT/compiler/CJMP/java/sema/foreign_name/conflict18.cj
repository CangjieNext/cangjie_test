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
class A2 <: A1 & I2 {
}

/* SCAN-IN
error: Declaration 'foo' has a conflicting @ForeignName annotation
  ==> conflict18.cj:19:5:
   | 
19 |       @ForeignName["fooI2"]
   |  _____^
20 | |     func foo(): Unit
   | |____________^
   | 
note: Other declaration 'foo' has a different @ForeignName
 ==> conflict18.cj:8:5:
  | 
8 |       @ForeignName["fooA1"]
  |  _____^
9 | |     public open func foo(): Unit
  | |________________________^
  | 
note: While checking declaration 'A2'
  ==> conflict18.cj:24:7:
   | 
24 | class A2 <: A1 & I2 {
   |       ^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

