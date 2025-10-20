// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

class Foo {

}

@JavaMirror
class M {
    public func foo(): Foo
}

/* SCAN-IN
error: return type 'Class-Foo' of function inside @JavaMirror class is not supported
  ==> java_mirror_method_ret_ty_mismatch.cj:12:24:
   | 
12 |     public func foo(): Foo
   |                        ^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

