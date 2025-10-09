// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %enable_java_cjmapping %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

package UNNAMED

import interoplib.interop.*
import java.lang.*

interface I {
  func bar(): Unit
}

public struct S  <:I {
  public func foo(param0: JArray<JString>, param1!: JArray<JString>, param2!: JArray<JString>= JArray<JString>(114514i32)): Int8  {
    1i8
  }

  public func bar(): Unit {
    print("cj: Hello from interface func bar()\n", flush: true)
  }

}

/* SCAN-IN
error: cangjie mirror struct type inheritance interface is not supported
  ==> cj_mapping_struct_inheritance_interface.cj:18:15:
*/