// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

interface I {
    @ForeignName["bar"]
    public func foo() {
    }
}

/* SCAN-IN
error: @ForeignName could only be used on FFI declaration member
 ==> regular_interface.cj:5:5:
  | 
5 |       public func foo() {
  |  _____^
6 | |     }
  | |_____^
  | 
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

