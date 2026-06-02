// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output %compile_shared_lib_opt %import_objc_interop 2>& 1 | compare %f

import objc.lang.*

func a(): ObjCFunc<Unit> {
    return unsafe { zeroValue() }
}

func b(): ObjCFunc<Float64> {
    return unsafe { zeroValue() }
}

func c(): ObjCFunc<String> {
    return unsafe { zeroValue() }
}

func d(): ObjCFunc<(String) -> Float64> {
    return unsafe { zeroValue() }
}

func e(): ObjCFunc<(Int64, ObjCPointer<Int64>, String) -> Float64> {
    return unsafe { zeroValue() }
}

/* SCAN-IN
error: ObjCFunc can only be used with function type over Objective-C compatible types
  ==> objc_func_type_illegal_type_argument.cj:11:20:
   | 
11 | func a(): ObjCFunc<Unit> {
   |                    ^^^^ 
*/

/* SCAN-IN
error: ObjCFunc can only be used with function type over Objective-C compatible types
  ==> objc_func_type_illegal_type_argument.cj:15:20:
   | 
15 | func b(): ObjCFunc<Float64> {
   |                    ^^^^^^^ 
*/

/* SCAN-IN
error: ObjCFunc can only be used with function type over Objective-C compatible types
  ==> objc_func_type_illegal_type_argument.cj:19:20:
   | 
19 | func c(): ObjCFunc<String> {
   |                    ^^^^^^ 
*/

/* SCAN-IN
error: ObjCFunc can only be used with function type over Objective-C compatible types
  ==> objc_func_type_illegal_type_argument.cj:23:21:
   | 
23 | func d(): ObjCFunc<(String) -> Float64> {
   |                     ^^^^^^ 
*/

/* SCAN-IN
error: ObjCFunc can only be used with function type over Objective-C compatible types
  ==> objc_func_type_illegal_type_argument.cj:27:48:
   | 
27 | func e(): ObjCFunc<(Int64, ObjCPointer<Int64>, String) -> Float64> {
   |                                                ^^^^^^ 
*/
