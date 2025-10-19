// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@JavaMirror
interface I {
    @JavaHasDefault[""]
    func foo(): Unit
    
    @JavaHasDefault["", 1]
    func foo1(): Unit
}

/* SCAN-IN
error: '@JavaHasDefault' can't have arguments
  ==> arguments_in_annotation.cj:11:5:
   | 
11 |     @JavaHasDefault[""]
   |     ^^^^^^^^^^^^^^^^^^^ 
   | 
*/

/* SCAN-IN
error: '@JavaHasDefault' can't have arguments
  ==> arguments_in_annotation.cj:14:5:
   | 
14 |     @JavaHasDefault["", 1]
   |     ^^^^^^^^^^^^^^^^^^^^^^ 
   | 
*/
