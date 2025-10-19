// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@JavaHasDefault
func f() {}

@JavaMirror
class C {
    public func foo(): Unit
}

/* SCAN-IN
error: '@JavaHasDefault' can be used only on @JavaMirror interface methods.
 ==> top_level_func.cj:9:1:
  | 
9 | @JavaHasDefault
  | ^^^^^^^^^^^^^^^ 
  |  
*/

