// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// SEPARATE-FILE: c/c.cj
// EXEC-0: %compiler %noColor --experimental c/c.cj --output-type=chir --output-dir ./c
package cmp
public common class A{
    public init(){}
    public common let a:Int64=1
}
public common struct B{
    public init(){}
    public common let b:Int64=2
}
public common interface C{
    common func foo():Unit
}
public common class D<:C{
    public init(){}
    public common func foo():Unit{
        println("class D foo")
    }
}
public common enum E{
    ONE|TWO|THREE
}
public common let lambda_a:()->A={=>A()}
public common let lambda_b:()->B
public common let lambda_c:()->C
public common let lambda_c2:()->D
public common let lambda_d:()->E

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp
public specific class A{
    public specific let a:Int64=1
    public let b:Int32=2
}
public specific struct B{
    public specific let b:Int64=2
}
public specific interface C{
    specific func foo():Unit
}
public specific class D<:C{
    public func goo():Unit{
        println("class D goo")
    }
}
public specific enum E{
    ONE|TWO|THREE
}
public specific let lambda_a:()->A={=>A()}
public specific let lambda_b:()->B={=>B()}
public specific let lambda_c:()->C={=>D()}
public specific let lambda_c2:()->D={=>D()}
public specific let lambda_d:()->E={=>ONE}
// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*
main(){
    let a=lambda_a()
    println(a.a)
    println(a.b)
    let b=lambda_b()
    println(b.b)
    let c=lambda_c()
    let d=lambda_c2()
    c.foo()
    d.goo()
    let e=lambda_d()
    match(e){
            case ONE=> println("ONE")
            case TWO=> println("TWO")
            case THREE=> println("THREE")
    }
}
/*SCAN
1
2
2
class D foo
class D goo
ONE
*/