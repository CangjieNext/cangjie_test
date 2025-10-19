// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

interface Ioo<O, P> {}
class Foo<T,R> {
    var filed:R
    init(x:R) { filed = x }
}
common extend<R,T> Foo<R,T> {
   common prop x1:T
   common prop x2:T {
        get(){ println("common::extend::prop:xx"); filed }
  }
   common prop x3:T {
        get(){ println("common::extend::prop:xx"); filed }
  }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

platform extend<R,T> Foo<R,T> {
    platform prop x1:T {    
        get(){ println("platform::extend::prop:x"); filed }
    }
    platform prop x3:T {
         get(){ println("platform::extend::prop:xx"); filed }
     }
}
main() {
   println(Foo<Int64,Int64>(3).x1)
   var foo=Foo<Int64,Int64>(3)
   println(foo.x2)
   println(foo.x3)
   return 0
}

/* SCAN
platform::extend::prop:x
3
common::extend::prop:xx
3
platform::extend::prop:xx
3
*/
