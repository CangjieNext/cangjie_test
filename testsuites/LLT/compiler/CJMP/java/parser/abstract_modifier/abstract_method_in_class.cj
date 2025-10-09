// (CJNATIVE and not Windows) EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>& 1 | compare %f

class C {
    public abstract func foo(): Unit
}

/* SCAN-IN
error: unexpected modifier 'abstract' on function declaration in class body
 ==> abstract_method_in_class.cj:4:12:
  | 
3 | class C {
  | ~~~~~ in class
4 |     public abstract func foo(): Unit
  |     ~~~~   ^^^^^^^^ unexpected modifier
  |     |
  |     on function declaration
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

