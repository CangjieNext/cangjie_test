// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %enable_java_cjmapping %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

package UNNAMED

import interoplib.interop.*
import java.lang.*

public struct S<T0, T1>  where T0 <: Object{
  public func foo(): JString  {
    JString("hello")
  }

}

/* SCAN-IN
error: cangjie mirror struct type generic S is not supported
  ==> cj_mapping_struct_generic.cj:14:16:
*/