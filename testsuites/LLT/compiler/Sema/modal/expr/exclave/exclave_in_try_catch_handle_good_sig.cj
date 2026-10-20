// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %enableEH %cmp_opt %f -o %output -Woff all 2>&1 | compare %f

import stdx.effect.Command

class C {
    init() {}
}

// All functions have a valid exclave signature (non-copy @local! param `c`),
// so exclave is rejected below only because of the enclosing try-catch/try-handle.

// control: outside any try, exclave is fine
func ok(c: C @local!): Unit {
    exclave { () }
}

func foo(c: C @local!): Unit {
    try {
        exclave {
            ()
        }
    } catch (_) {
        ()
    }
}

func bar(c: C @local!): Unit {
    try {
        ()
    } catch (_) {
        exclave {
            ()
        }
    }
}

func baz(c: C @local!): Unit {
    try {
        ()
    } handle (_: Command<Unit>) {
        exclave {
            ()
        }
    }
}

func nested(c: C @local!): Unit {
    try {
        exclave {
            exclave {
                ()
            }
        }
    } catch (_) {
        ()
    }
}

func nestedCatch(c: C @local!): Unit {
    try { () } catch (_) {
        try { () } catch (_) { () }
        exclave { () }
    }
}

func nestedHandle(c: C @local!): Unit {
    try { () } handle (_: Command<Unit>) {
        try { () } handle (_: Command<Unit>) { () }
        exclave { () }
    }
}

main() {}

/* SCAN
error: cannot use exclave expression in try-catch
  ==> exclave_in_try_catch_handle_good_sig.cj:25:9:
   | 
25 |           exclave {
   |  _________^
26 | |             ()
27 | |         }
   | |_________^
   | 

error: cannot use exclave expression in try-catch
  ==> exclave_in_try_catch_handle_good_sig.cj:37:9:
   | 
37 |           exclave {
   |  _________^
38 | |             ()
39 | |         }
   | |_________^
   | 

error: cannot use exclave expression in try-handle
  ==> exclave_in_try_catch_handle_good_sig.cj:47:9:
   | 
47 |           exclave {
   |  _________^
48 | |             ()
49 | |         }
   | |_________^
   | 

error: cannot use exclave expression in try-catch
  ==> exclave_in_try_catch_handle_good_sig.cj:55:9:
   | 
55 |           exclave {
   |  _________^
56 | |             exclave {
   | | ...
59 | |         }
   | |_________^
   | 

error: exclave cannot be nested
  ==> exclave_in_try_catch_handle_good_sig.cj:56:13:
   | 
55 |            exclave {
   |  __________~
56 | |              exclave {
   | | _____________^
57 | ||                 ()
58 | ||             }
   | ||_____________^ outer exclave is here
59 | |          }
   | |__________~
   | 

error: cannot use exclave expression in try-catch
  ==> exclave_in_try_catch_handle_good_sig.cj:68:9:
   | 
68 |         exclave { () }
   |         ^^^^^^^^^^^^^^ 
   | 

error: cannot use exclave expression in try-handle
  ==> exclave_in_try_catch_handle_good_sig.cj:75:9:
   | 
75 |         exclave { () }
   |         ^^^^^^^^^^^^^^ 
   | 

7 errors generated, 7 errors printed.
*/
