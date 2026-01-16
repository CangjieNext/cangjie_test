// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c -g
package cmp

public common struct E<T>{
    var field : T
    public init(y : T) {
        println("init")
        field = y
    }
    public common func goo() : T {
        println("common::goo")
        return field
    }
    public common func foo(x: T) : T {
        println("common::foo")
        return x
    }
}

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p -g
package cmp

public specific struct E<T>{
    public specific func foo(x: T) : T {
        println("specific::foo")
        return x
    }
}


// SEPARATE-FILE: main.cj
// EXEC-0: %compiler  main.cj --import-path=./p -L./p -lcmp -o %output -g
// (CJNATIVE and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
import cmp.*

main() {
    var d = E<Int64>(2)
    d.foo(3)
    0
}
/* SCAN
init
specific::foo
*/
