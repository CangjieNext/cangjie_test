// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

class Foo {

}

@JavaMirror
class M {
    init(a: Foo)
}

/* SCAN-IN
error: argument type of java-mirrored constructor must be of @JavaMirror type
  ==> java_mirror_ctor_type_mismatch.cj:12:10:
   | 
12 |     init(a: Foo)
   |          ^^^^^^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

