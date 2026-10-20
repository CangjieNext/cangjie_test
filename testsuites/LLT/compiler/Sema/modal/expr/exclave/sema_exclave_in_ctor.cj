// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output -Woff all 2>&1 | compare %f

class C {
    init() {}
}

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

class G {
    static init() {
        // A lambda is a frame: its signature allows exclave, no "in static init" here.
        let ok: (C @local!) -> Unit = { x => exclave { () } }
    }
    ~init() {
        // Ill-signed lambda reports its signature error, not "in finalizer".
        let bad: (Int64) -> Unit = { x => exclave { () } }
    }
}

func foo() {
    spawn {
        exclave {
            42
        }
    }
}

func spawnLambda() {
    spawn {
        // The spawn's task lambda frame is skipped, so this still reports the spawn.
        let f: (C @local!) -> Unit = { x => exclave { () } }
    }
}

main(): Int64 {
    // Nested func and lambda frames stop the forbidden-context search;
    // whether exclave is allowed depends on their own signatures.
    func nested(x: C @local!) {
        exclave { () }
    }
    let ok: (C @local!) -> Unit = { x => exclave { () } }
    let bad: (Int64) -> Unit = { x => exclave { () } }
    exclave {
        42
    }
}

/* SCAN
error: cannot use exclave expression in static init
  ==> sema_exclave_in_ctor.cj:15:9:
   | 
15 |           exclave {
   |  _________^
16 | |             ()
17 | |         }
   | |_________^
   | 

error: cannot use exclave expression in finalizer
  ==> sema_exclave_in_ctor.cj:20:9:
   | 
20 |           exclave {
   |  _________^
21 | |             ()
22 | |         }
   | |_________^
   | 

error: cannot use exclave expression in static init
  ==> sema_exclave_in_ctor.cj:28:9:
   | 
28 |           exclave {
   |  _________^
29 | |             ()
30 | |         }
   | |_________^
   | 

error: exclave must be used in function with @local! non copy param or @local!/@local? non copy return type
  ==> sema_exclave_in_ctor.cj:41:43:
   | 
41 |         let bad: (Int64) -> Unit = { x => exclave { () } }
   |                                           ^^^^^^^^^^^^^^ 
   | 

error: cannot use exclave expression in spawn expr
  ==> sema_exclave_in_ctor.cj:47:9:
   | 
47 |           exclave {
   |  _________^
48 | |             42
49 | |         }
   | |_________^
   | 

error: exclave must be used in function with @local! non copy param or @local!/@local? non copy return type
  ==> sema_exclave_in_ctor.cj:67:39:
   | 
67 |     let bad: (Int64) -> Unit = { x => exclave { () } }
   |                                       ^^^^^^^^^^^^^^ 
   | 

error: cannot use exclave expression in main
  ==> sema_exclave_in_ctor.cj:68:5:
   | 
68 |       exclave {
   |  _____^
69 | |         42
70 | |     }
   | |_____^
   | 

7 errors generated, 7 errors printed.
*/
