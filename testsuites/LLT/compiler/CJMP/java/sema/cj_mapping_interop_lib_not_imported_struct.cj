// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %enable_java_cjmapping %f -o %output %compile_shared_lib_opt 2>& 1 | compare %f

package UNNAMED

public struct S  {
  public func foo(): Int8  {
    1i8
  }
}

/* SCAN-IN
error: interoplib.interop must be imported to use java interoperability
  ==> cj_mapping_interop_lib_not_imported_struct.cj:11:1:
*/
