// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
class Foo<T,R>{ 
    var filed:R 
    init(x:R){
        filed = x
    }
}
common extend<R,T> Foo<R,T> {
   common func f1(x:R):R {x}
   common func f2<T>(x:T,y:R):Foo<R,T> {println("kkk");Foo<R,T>(x)}
   common prop x:T {
      get(){
        filed
      }
   }
   func f11(x:R):R {f1(x)}
   func f22<T>(x:T,y:R):Foo<R,T> {println("ddd");f2<T>(x,y)}
   prop xx:T {
      get(){
        x
      }
   }

}

// SEPARATE-FILE: p1/p.cj
// EXEC-0: %compiler %noColor --experimental p1/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p1 && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p1;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p1 && %run %output 2>&1 | compare %f
package cmp
platform extend<R,T> Foo<R,T> {
   platform func f1(x:R):R {x}
   platform func f2<T>(x:T,y:R):Foo<R,T> {println("platform:p1:f2");Foo<R,T>(x)}
   platform prop x:T {
      get(){
        filed
      }
   }
}


main(){
   println(Foo<Int64,String>("x").f1(3))
   var foo = Foo<Int64,String>("a")
   println(foo.x)
   foo.f2<String>("c",5)

   println(Foo<Int64,String>("x").f11(22))
   var foo1 = Foo<Int64,String>("b")
   println(foo1.xx)
   foo1.f22<String>("c",12)

   0
}

/* SCAN
3
a
platform:p1:f2
22
b
ddd
platform:p1:f2
*/
