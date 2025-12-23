// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-1: %compiler %cmp_opt %f -o %output -Woff all

class A {
    static init() {
        exclave {
            ()
        }
    }
    ~init() {
        exclave {
            ()
        }
    }
}

struct F {
    static init() {
        exclave {
            ()
        }
    }
}

func foo() {
    spawn {
        exclave {
            42
        }
    }
}

main(): Int64 {
    exclave {
        42
    }
}

/* SCAN
error: cannot use exclave expression in static init
  ==> sema_exclave_in_ctor.cj:11:9:
   | 
11 |           exclave {
   |  _________^
12 | |             ()
13 | |         }
   | |_________^
   | 

error: cannot use exclave expression in constructor
  ==> sema_exclave_in_ctor.cj:16:9:
   | 
16 |           exclave {
   |  _________^
17 | |             ()
18 | |         }
   | |_________^
   | 

error: cannot use exclave expression in finalizer
  ==> sema_exclave_in_ctor.cj:21:9:
   | 
21 |           exclave {
   |  _________^
22 | |             ()
23 | |         }
   | |_________^
   | 

error: cannot use exclave expression in constructor
  ==> sema_exclave_in_ctor.cj:29:9:
   | 
29 |           exclave {
   |  _________^
30 | |             ()
31 | |         }
   | |_________^
   | 

error: cannot use exclave expression in spawn_expr
  ==> sema_exclave_in_ctor.cj:37:9:
   | 
37 |           exclave {
   |  _________^
38 | |             42
39 | |         }
   | |_________^
   | 

error: cannot use exclave expression in main
  ==> sema_exclave_in_ctor.cj:44:5:
   | 
44 |       exclave {
   |  _____^
45 | |         42
46 | |     }
   | |_____^
   | 

6 errors generated, 6 errors printed.
*/
