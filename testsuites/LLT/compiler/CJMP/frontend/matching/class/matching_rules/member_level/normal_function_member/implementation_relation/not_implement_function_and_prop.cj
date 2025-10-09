// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
common class S {
    public common func foo():Unit{
        println("common class foo")
    }
    static common func goo():Unit{
        println("common class static goo")
    }
    public common init(){
        println("common class s")
    }
    private var a:Int64=1
    mut common prop b:Int64{
        get(){
            println("get a")
            a
        }
        set(value){
            println("set a")
            a=value
        } 
    }
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo -o %output
// (LLVM and Linux)RUN-EXEC-PIPE-0: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
// (LLVM and Windows)RUN-EXEC-PIPE-0: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (LLVM and Darwin)RUN-EXEC-PIPE-0: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p && %run %output 2>&1 | compare %f
package cmp
platform class S {
}
main() {
    let s=S()
    S.goo()
    s.foo()
    let a=s.b
    println(a)
    s.b=2
}

/* SCAN
common class s
common class static goo
common class foo
get a
1
set a
*/