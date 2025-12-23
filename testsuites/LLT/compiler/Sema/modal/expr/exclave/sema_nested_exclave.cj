// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output -Woff all 2>&1 | compare %f

func foo() {
    exclave {
        exclave {
            3
        }
    }
}
main() {}

/* SCAN
error: exclave cannot be nested
  ==> sema_nested_exclave.cj:11:9:
   | 
10 |        exclave {
   |  ______~
11 | |          exclave {
   | | _________^
12 | ||             3
13 | ||         }
   | ||_________^ outer exclave is here
14 | |      }
   | |______~
   | 

1 error generated, 1 error printed.
*/
