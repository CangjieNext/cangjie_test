// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f

@C
struct Data {}

enum Kind {
    | K1(Data)
}

main() {}

/* SCAN
error: member func 'K1' of enum 'Kind' mustn't has struct with @C
 ==> constraint_2.cj:7:7:
  | 
7 |     | K1(Data)
  |       ^ 
  | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
