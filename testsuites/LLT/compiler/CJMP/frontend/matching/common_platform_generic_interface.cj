// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
 
// LEVEL: 1 
// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp

common interface TestIface1<T> {}

common interface TestIface2<T> {
    func f(_: T): Unit
    common func g(_: T): Unit
}

class CommonImplementor <: TestIface1<String> & TestIface2<Int> {
  public func f(num: Int) {
    println("CommonImplementor: ${num}")
  }

  public func g(num: Int) {
      println("CommonImplementor: g: ${num}")
  }
}
 
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output 
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

specific interface TestIface1<T> {}

specific interface TestIface2<T> {
    specific func g(_: T): Unit
}

class PlatformImplementor <: TestIface1<String> & TestIface2<Int> {
  public func f(num: Int) {
    println("PlatformImplementor: ${num}")
  }

  public func g(num: Int) {
      println("PlatformImplementor: g: ${num}")
  }
}
 
main(): Unit {
  CommonImplementor().f(111)
  CommonImplementor().g(112)
  PlatformImplementor().f(222)
  PlatformImplementor().g(223)
}
 
/* SCAN
CommonImplementor: 111
CommonImplementor: g: 112
PlatformImplementor: 222
PlatformImplementor: g: 223
*/
