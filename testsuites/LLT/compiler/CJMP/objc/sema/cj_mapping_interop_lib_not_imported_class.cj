// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %enable_objc_cjmapping %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

package noname

public class CangjieData {
}

/* SCAN-IN
error: interoplib.objc must be imported to use Objective-C interoperability
  ==> cj_mapping_interop_lib_not_imported_class.cj:11:1:
*/
