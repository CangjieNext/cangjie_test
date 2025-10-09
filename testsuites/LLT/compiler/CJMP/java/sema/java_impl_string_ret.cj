// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

@JavaImpl
class M <: JObject {
    public func foo() {
        return "123"
    }

    public func goo(): String {
        return "123"
    }
}

/* SCAN-IN
error: return type 'Struct-String' of function inside @JavaImpl class is not supported
  ==> java_impl_string_ret.cj:8:5:
   | 
8  |       public func foo() {
   |  _____^
9  | |         return "123"
10 | |     }
   | |_____^
   | 

error: return type 'Struct-String' of function inside @JavaImpl class is not supported
  ==> java_impl_string_ret.cj:12:24:
   | 
12 |     public func goo(): String {
   |                        ^^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

