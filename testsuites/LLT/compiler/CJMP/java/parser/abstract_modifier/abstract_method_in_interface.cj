// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

interface I {
    public abstract func foo(): Unit
}

/* SCAN-IN
error: unexpected modifier 'abstract' on function declaration in interface body
 ==> abstract_method_in_interface.cj:4:12:
  | 
3 | interface I {
  | ~~~~~~~~~ in interface
4 |     public abstract func foo(): Unit
  |            ^^^^^^^^ ~~~~ on function declaration
  |            |
  |            unexpected modifier
  | 
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

