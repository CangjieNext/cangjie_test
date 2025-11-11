// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

@JavaMirror
open class JMirror {
    init()
}

open class PureCangjie <: JMirror {
    init() {}
}


/* SCAN-IN
error: super declaration 'JMirror' is inheritable only for declaration annotated with @JavaMirror or @JavaImpl
  ==> java_mirror_cannot_be_supertype.cj:11:1:
   | 
11 |   open class PureCangjie <: JMirror {
   |  _^
12 | |     init() {}
13 | | }
   | |_^
   | 
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

