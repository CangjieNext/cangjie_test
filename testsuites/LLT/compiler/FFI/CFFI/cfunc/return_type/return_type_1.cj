// EXEC-PIPE-1: %compiler %noColor %cmp_opt_chir2hlir %f 2>&1 | compare %f

@C
func call_in_cj() {
    Exception("end\n")
}

main() {}

/* SCAN
error: return type of CFunc must be instantiated with CType
 ==> return_type_1.cj:4:6:
  | 
4 | func call_in_cj() {
  |      ^^^^^^^^^^ 
  | 
  # note: return type is Class-Exception

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
