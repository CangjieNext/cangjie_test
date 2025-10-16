// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.*

@JavaMirror
abstract class C {
    public abstract func foo(): Unit
}

@JavaMirror
class CImpl <: C {
    // no abstract func implementation
}

/* SCAN-IN
error: class 'CImpl' missing abstract modifier, otherwise abstract function or property should be implemented
  ==> abstract_method_is_not_implemented.cj:12:1:
   | 
12 | class CImpl <: C {
   | ^ 
   | 
note: unimplemented abstract function foo
 ==> abstract_method_is_not_implemented.cj:8:5:
  | 
8 |     public abstract func foo(): Unit
  |     ^ 
  | 
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

