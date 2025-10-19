// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

@JavaHasDefault
interface I {
}

/* SCAN-IN
error: unexpected annotation '@JavaHasDefault' on interface
  ==> interface.cj:9:1:
   | 
9  | @JavaHasDefault
   | ^^^^^^^^^^^^^^^ unexpected annotation here
10 | interface I {
   | ~~~~~~~~~ on interface
   | 
*/
