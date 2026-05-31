// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f


import java.lang.JObject

@Java
open foreign class JMirror {
    init()
}

open class PureCangjie <: JMirror {
    init() {}
}


/* SCAN-IN
error: super type 'JMirror' is inheritable only by @Java types
  ==> java_mirror_cannot_be_supertype.cj:11:1:
   | 
11 |   open class PureCangjie <: JMirror {
   |  _^
12 | |     init() {}
13 | | }
   | |_^
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

