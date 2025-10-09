// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f


import interoplib.interop.*
import java.lang.JObject

@JavaMirror
public class MyObject {

}


public interface MyInterface {
    func foo(): Unit
}


extend MyObject <: MyInterface {
    public func foo(): Unit {

    }
}

/* SCAN-IN
error: @JavaMirror class cannot be extended with interface
  ==> java_mirror_extend_with_cangjie_interface.cj:18:1:
   | 
18 |   extend MyObject <: MyInterface {
   |  _^
19 | |     public func foo(): Unit {
   | | ...
22 | | }
   | |_^
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

