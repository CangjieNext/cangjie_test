// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
public common var a:Int32=1
common interface A{
    func foo(arg:Int32):Unit//it should be abstract func foo(arg:Int32):Unit arrcording to spec, but cjc not support
    common func goo():Unit
}
public common class B<:A{
    public var b:Int32=0
    public init(){}
    public func foo(arg:Int32):Unit{
        a=arg
    }
    public common func goo():Unit{
        println(a)
    }
}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp
platform interface A{
    platform func goo():Unit
    {
        println(a)
    }
}
public platform class B<:A{
}
// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*
main():Unit{
    let a2=B()
    a2.foo(3)
    a2.goo()
    println(a2.b)
}
/*SCAN
3
0
*/