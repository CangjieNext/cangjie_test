// EXEC-PIPE-1: %compiler %cmp_opt %n.cj -o %n.%suffix 2>&1 | compare %f

@C
struct Data {
    var a = 0
}

main() {
    let d = Data()
    var f = { => d.a }
    f()
}

/* SCAN
error: captured variable mustn't be struct with @C
  ==> constraint_3.cj:10:18:
   | 
10 |     var f = { => d.a }
   |                  ^ 
   | 

1 error generated, 1 error printed.
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
