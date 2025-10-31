// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common extend<R> Array<R> {
   common func f1(x:R):R {x}
   common func f2<Z>(x:Z):Array<Z> {println("kkk");Array<Z>()}
   common prop x:Int64 {
      get(){
        3
      }
   }
   func f11(x:R):R {f1(x)}
   func f22<Z>(x:Z):Array<Z> {println("ddd");f2<Z>(x)}
   prop xx:Int64 {
      get(){
        x
      }
   }

}
interface I{}
extend Int64<:I{}
common extend<R> Array<R> where R<:I {
   func f111(x:R):R {f1(x)}
   func f222<Z>(x:Z):Array<Z> {println("ddd");f2<Z>(x)}

}


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
platform extend<R> Array<R> {}

platform extend<R> Array<R> where R<:I{
}


main(){
   var array:Array<Int64> = [1,2,3]
   println(array.f1(3))

   println(array.x)
   array.f2<String>("c")

   println(array.f11(44))
   println(array.xx)
   array.f22<String>("c")

   println(array.f111(44))
   array.f222<String>("c")

   0
}

/* SCAN
3
3
kkk
44
3
ddd
kkk
44
ddd
kkk
*/
