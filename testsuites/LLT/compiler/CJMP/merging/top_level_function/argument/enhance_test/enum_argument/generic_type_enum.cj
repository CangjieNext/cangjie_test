// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
func ONE<T>(a:T):T{
    a
}

enum A<T> {
    ONE(T)|TWO(T)|THREE(T)
}
    
common func foo<T>(arg: A<T>): Unit {
    println("common")
}

common func foo1<T>(arg: A<T>): Unit

common func foo2<T>(arg: A<T>): Unit {
    println("common")
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp

specific func foo<T>(arg: A<T>): Unit {
    println("specific")
}

specific func foo1<T>(arg: A<T>): Unit {
    println("specific")
}

main() {
    foo(A.ONE(0))
    foo1(A.TWO(1))
    foo2(A.THREE(2))
}

/* SCAN
specific
specific
common
*/