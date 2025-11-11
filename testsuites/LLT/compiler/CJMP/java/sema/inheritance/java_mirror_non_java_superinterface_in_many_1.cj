// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

@JavaMirror
open class JMirrorSuperClass {}

interface PureCangjie {
}

@JavaMirror
class JMirror <: JMirrorSuperClass & PureCangjie {
}

/* SCAN-IN
error: @JavaMirror-annotated declaration cannot inherit pure cangjie type
  ==> java_mirror_non_java_superinterface_in_many_1.cj:13:1:
   | 
13 |   class JMirror <: JMirrorSuperClass & PureCangjie {
   |  _^
14 | | }
   | |_^
   | 
note: 'PureCangjie' is not a java-compatible type
  ==> java_mirror_non_java_superinterface_in_many_1.cj:13:38:
   | 
13 | class JMirror <: JMirrorSuperClass & PureCangjie {
   |                                      ^^^^^^^^^^^ 
   | 
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

