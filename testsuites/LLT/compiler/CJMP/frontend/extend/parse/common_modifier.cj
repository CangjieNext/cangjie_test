// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.


// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp


common class Foo{ init() {} }
common extend Foo {
   common public func f1():Unit {}
   common func f2():Unit {}
   common protected func f3():Unit {}
   common protected func f4():Unit {f3()}

   common static public func s1():Unit {}
   common static func s2():Unit {}
   common static protected func s3():Unit {}
   common static protected func s4():Unit {s3()}
}


// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output
package cmp

specific class Foo{ }
specific extend Foo {
   specific public func f1():Unit {}
   specific func f2():Unit {}
   specific protected func f3():Unit {}
   specific protected func f4():Unit {f3()}

   specific static public func s1():Unit {}
   specific static func s2():Unit {}
   specific static protected func s3():Unit {}
   specific static protected func s4():Unit {s3()}
}

main(){
}