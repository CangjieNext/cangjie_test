// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
public common var a:Int32=1
public common class B{}
// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp
public class A{
    public func foo(arg:Int32):Unit{
        a=arg
    }
    public func goo(arg:Int32):Unit{
        println(arg)
    }
}
public platform class B{
    public func foo(arg:Int32):Unit{
        a=arg
    }
    public func goo(arg:Int32):Unit{
        println(arg)
    }
    public init(){}
}
// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor -j8 m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*
main():Unit{
    let a2=A()
    a2.foo(3)
    a2.goo(a)
    let a3=B()
    a3.foo(a+1)
    a3.goo(a)
}
/*SCAN
3
4
*/