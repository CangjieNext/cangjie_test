// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: apilevel.cj canIUse.cj device_info.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt device_info.cj -o device_info.%middle
// ERRCHECK: %compiler %noColor %cmp_opt_chir2hlir %f device_info.%middle -o %output --cfg=APILevel_level=30

import ohos.device_info.*
import ohos.labels.*

@APILevel[since: "39"]
public func foo() {}

@APILevel[since: "38"]
public func goo() {
    let a = @IfAvailable(level: 39, {=>
        foo()
    }, {=>
        foo()
    })
}

main() {}

/* SCAN
error: cannot reference 'foo'(level: 39) which higher than level of the current scope(level: 38)
  ==> test09.cj:23:9:
   | 
23 |         foo()
   |         ^^^^^ 
   | 

1 error generated, 1 error printed.
*/
