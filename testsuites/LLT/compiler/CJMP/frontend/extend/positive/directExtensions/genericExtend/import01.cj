// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/ca.cj
// EXEC-0: %compiler %noColor --experimental c/ca.cj --output-type=chir --output-dir ./c
package a
 
public class Foo<T,R> {
    var filed:R
    public init(x:R) { filed = x }
}
common extend<R,T> Foo<R,T> {
   public common prop xx:T {
        get(){ println("common::extend::prop:xx"); filed }
    }
}

public func runCommon() {
    let a =  Foo<Int64,Int64>(1)
    println(a.xx)
}
 
// SEPARATE-FILE: p/pa.cj
// EXEC-0: %compiler %noColor --experimental p/pa.cj ./c/a.chir --common-part-cjo=./c/a.cjo --output-type=dylib --output-dir=./p
package a
 
platform extend<R,T> Foo<R,T> {
  public platform prop xx:T {
        get(){ println("platform::extend::prop:xx"); filed }
    }

}
public func run() {
     let a =  Foo<Int64,Int64>(2)
    println(a.xx)
}
 
 
// SEPARATE-FILE: c/cb.cj
// EXEC-0: %compiler %noColor --experimental c/cb.cj --import-path=./c --output-type=chir --output-dir ./c
package b
 
import a.*
public func runCommonFromB() {
    let a =  Foo<Int64,Int64>(3)
    println(a.xx)
 
}
 
// SEPARATE-FILE: p/pb.cj
// EXEC-0: %compiler %noColor --experimental p/pb.cj ./c/b.chir --common-part-cjo=./c/b.cjo --import-path=./p --output-type=dylib --output-dir=./p
package b
 
import a.*
 
public func runFromB() {
    let a =  Foo<Int64,Int64>(4)
    println(a.xx)
}
 
// SEPARATE-FILE: m_platform.cj
// EXEC-0: %compiler %noColor m_platform.cj --import-path=./p -L./p -la -lb -o %output
// EXEC-0: export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p:
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p: %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
import a.*
import b.*
 
main() {
    runCommon()
    run()
    println("===")
    runCommonFromB()
    runFromB()
}

/* SCAN
platform::extend::prop:xx
1
platform::extend::prop:xx
2
===
platform::extend::prop:xx
3
platform::extend::prop:xx
4
*/
