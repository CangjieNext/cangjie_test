// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

@JavaMirror
open class M1 {
    public init()
    public open func foo(): Unit
}

@JavaImpl 
class M2 <: M1 {
    @ForeignName["foo"]
    public open func foo(): Unit {}
}

/* SCAN-IN
error: @ForeignName could not appear on overridden declaration
  ==> added_in_impl.cj:14:5:
   | 
14 |       @ForeignName["foo"]
   |  _____^
15 | |     public open func foo(): Unit {}
   | |________________________^
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

