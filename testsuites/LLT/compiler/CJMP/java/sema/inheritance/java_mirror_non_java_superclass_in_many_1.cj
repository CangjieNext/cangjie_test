// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

@JavaMirror
interface JMirrorSuperInterface {}

open class PureCangjie {
    init() {}
}

@JavaMirror
class JMirror <: PureCangjie & JMirrorSuperInterface {
}

/* SCAN-IN
error: @JavaMirror-annotated declaration cannot inherit pure cangjie type
  ==> java_mirror_non_java_superclass_in_many_1.cj:14:1:
   | 
14 |   class JMirror <: PureCangjie & JMirrorSuperInterface {
   |  _^
15 | | }
   | |_^
   | 
note: 'PureCangjie' is not a java-compatible type
  ==> java_mirror_non_java_superclass_in_many_1.cj:14:18:
   | 
14 | class JMirror <: PureCangjie & JMirrorSuperInterface {
   |                  ^^^^^^^^^^^ 
   |
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

