// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: apilevel.cj canIUse.cj device_info.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt canIUse.cj -o canIUse.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt device_info.cj -o device_info.%middle
// ERRCHECK: %compiler %noColor %cmp_opt_chir2hlir %f canIUse.%middle device_info.%middle -o %output --cfg=APILevel_level=21 -Woff unused

import ohos.base.canIUse
import ohos.labels.*
import ohos.device_info.*

@!APILevel[since: "19"]
public func f19() {}

@!APILevel[since: "20"]
public func f20() {}

@!APILevel[since: "21"]
public func f21() {}

@!APILevel[since: "22"]
public func f22() {}

@!APILevel[since: "23"]
public func f23() {}

main() {
    @IfAvailable(level: 20, {=> 
        @IfAvailable(level: 22, {=> // <= 22
            f19() // ok
            f20() // ok
            f21() // ok
            f22() // ok
            f23() // error
        }, {=> // <= 20
            f19() // ok
            f20() // ok
            f21() // error
            f22() // error
            f23() // error
        }) 
    }, {=>
        @IfAvailable(level: 21, {=> // <= 21
            f19() // ok
            f20() // ok
            f21() // ok
            f22() // error
            f23() // error
        }, {=> // <= 20
            f19() // ok
            f20() // ok
            f21() // error
            f22() // error
            f23() // error
        })
    })
}

/* SCAN
error: cannot reference 'f23'(level: 23) which higher than level of the current scope(level: 22)
  ==> test07.cj:39:13:
   | 
39 |             f23() // error
   |             ^^^^^ 
   | 

error: cannot reference 'f21'(level: 21) which higher than level of the current scope(level: 20)
  ==> test07.cj:43:13:
   | 
43 |             f21() // error
   |             ^^^^^ 
   | 

error: cannot reference 'f22'(level: 22) which higher than level of the current scope(level: 20)
  ==> test07.cj:44:13:
   | 
44 |             f22() // error
   |             ^^^^^ 
   | 

error: cannot reference 'f23'(level: 23) which higher than level of the current scope(level: 20)
  ==> test07.cj:45:13:
   | 
45 |             f23() // error
   |             ^^^^^ 
   | 

error: cannot reference 'f22'(level: 22) which higher than level of the current scope(level: 21)
  ==> test07.cj:52:13:
   | 
52 |             f22() // error
   |             ^^^^^ 
   | 

error: cannot reference 'f23'(level: 23) which higher than level of the current scope(level: 21)
  ==> test07.cj:53:13:
   | 
53 |             f23() // error
   |             ^^^^^ 
   | 

error: cannot reference 'f22'(level: 22) which higher than level of the current scope(level: 21)
  ==> test07.cj:58:13:
   | 
58 |             f22() // error
   |             ^^^^^ 
   | 

error: cannot reference 'f23'(level: 23) which higher than level of the current scope(level: 21)
  ==> test07.cj:59:13:
   | 
59 |             f23() // error
   |             ^^^^^ 
   | 

8 errors generated, 8 errors printed.
*/
