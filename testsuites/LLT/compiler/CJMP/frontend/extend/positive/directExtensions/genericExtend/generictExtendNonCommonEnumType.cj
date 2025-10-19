// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
enum Foo<T,R>{ 
    E(T,R)|F
    func goo(x:R){
        x
    }
}
common extend<R,T> Foo<R,T> {
  common  func f1(x:T,x1:R):R {x1}
  common  func f2<T>(x:T,y:R):Foo<T,R> {println("kkk"); F}
 
  func f11(x:T,x1:R):R {F.f1(x,x1)}
  func f22<T>(x:T,y:R):Foo<T,R> {println("ddd");f2<T>(x,y)}
}


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
platform extend<R,T> Foo<R,T> {
}


main(){
    E(2,3)
   println(E(2,3).f1(3,3))
    E("c",3).f2<String>("c","6")

   println(E(2,3).f11(3,3))
    E("c",3).f22<String>("c","6")

   0
}

/* SCAN
3
kkk
3
ddd
kkk
*/
