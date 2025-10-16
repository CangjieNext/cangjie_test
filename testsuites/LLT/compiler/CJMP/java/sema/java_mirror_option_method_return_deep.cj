// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

@JavaMirror
class OtherMirror {
   public init()
}

@JavaMirror
class M {
    public func foo(): ?????JObject
    public func self(): ??M
    public func other(): ???OtherMirror
}

/* SCAN-IN
error: return type 'Enum-Option<Enum-Option<Enum-Option<Enum-Option<Enum-Option<Class-JObject>>>>>' of function inside @JavaMirror class is not supported
  ==> java_mirror_option_method_return_deep.cj:13:24:
   | 
13 |     public func foo(): ?????JObject
   |                        ^^^^^^^^^^^^ 
   | 

*/
/* SCAN-IN
error: return type 'Enum-Option<Enum-Option<Class-M>>' of function inside @JavaMirror class is not supported
  ==> java_mirror_option_method_return_deep.cj:14:25:
   | 
14 |     public func self(): ??M
   |                         ^^^ 
   | 

*/
/* SCAN-IN
error: return type 'Enum-Option<Enum-Option<Enum-Option<Class-OtherMirror>>>' of function inside @JavaMirror class is not supported
  ==> java_mirror_option_method_return_deep.cj:15:26:
   | 
15 |     public func other(): ???OtherMirror
   |                          ^^^^^^^^^^^^^^ 
   | 

*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

