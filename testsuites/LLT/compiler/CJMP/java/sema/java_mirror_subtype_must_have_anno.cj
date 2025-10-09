// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

@JavaMirror
open class M {
    init()
}

class A <: M {
    A() {
        super()
    }

    public func foo(): Int64 {
        return 1
    }
}


/* SCAN-IN
error: super declaration 'M' is inheritable only for declaration annotated with @JavaMirror or @JavaImpl
  ==> java_mirror_subtype_must_have_anno.cj:11:1:
   | 
11 |   class A <: M {
   |  _^
12 | |     A() {
   | | ...
19 | | }
   | |_^
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

