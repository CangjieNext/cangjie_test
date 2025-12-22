// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
 
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
 
package cmp
 
interface I<T>{}
common class Container<T> <:I<T>{
  common var item:?T = Option<T>.None 
  init() {}
}
common extend<T> Container<T> {
  common func setItem(newItem:T):Unit 
  common func getItem():?T
}
 
 
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
 
platform class Container<T> <:I<T>{
  platform var item:?T = Option<T>.None 
 
}
 
platform extend<T> Container<T> {
  platform func setItem(newItem:T):Unit {item = newItem}
  platform func getItem():?T {item}
} 
main(){
   var container = Container<Int64>()
 
   println(container.getItem())
   println(container.setItem(3))
   println(container.getItem())
 
 0
}
 
/* SCAN
None
()
Some(3)
*/