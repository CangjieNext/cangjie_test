// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: apilevel.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt apilevel.cj -o apilevel.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt %f apilevel.%middle -Woff unused -o %output --cfg=APILevel_level=20.1.5
// ERRCHECK: %compiler %cmp_opt %compile_lib_opt %f apilevel.%middle -Woff unused -o %output --cfg=APILevel_level=20.1.4

import ohos.labels.*

@!APILevel[since: "20.1.5"]
public func f2015(): Unit {
}

@!APILevel[since: "20.1.5"]
public class C2015 {
    public init() {}
}

@!APILevel[since: "26.0.0"]
public func f2600(): Unit {
}

main() {
    f2015()
    var c = C2015()
    let _ = c
}

/* SCAN
error: cannot reference 'f2015'(level: 20.1.5) which higher than level of the current scope(level: 20.1.4)
  ==> triple_format_positive.cj:28:5:
   | 
28 |     f2015()
   |     ^^^^^^^ 
   | 

error: cannot reference 'C2015'(level: 20.1.5) which higher than level of the current scope(level: 20.1.4)
  ==> triple_format_positive.cj:29:13:
   | 
29 |     var c = C2015()
   |             ^^^^^^^ 
   | 

2 errors generated, 2 errors printed.
*/
