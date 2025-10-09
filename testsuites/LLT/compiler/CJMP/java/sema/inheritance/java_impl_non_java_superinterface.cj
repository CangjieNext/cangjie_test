// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_java_interop 2>& 1 | compare %f

import interoplib.interop.*
import java.lang.JObject

interface PureCangjie {
   
}

@JavaImpl
class JImpl <: PureCangjie {
}

/* SCAN-IN
error: @JavaImpl-annotated declaration cannot inherit pure cangjie type
  ==> java_impl_non_java_superinterface.cj:11:1:
   | 
11 |   class JImpl <: PureCangjie {
   |  _^
12 | | }
   | |_^
   | 
note: 'PureCangjie' is not a java-compatible type
  ==> java_impl_non_java_superinterface.cj:11:16:
   | 
11 | class JImpl <: PureCangjie {
   |                ^^^^^^^^^^^ 
   | 
*/

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

