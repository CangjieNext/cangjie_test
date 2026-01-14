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
public common let lambda_a:(A,A)->Int64={arg1:A,arg2:A=>arg1.a+arg2.a}
public common let lambda_b:(B)->Int64
public common let lambda_c:(C)->Unit
public common let lambda_c2:(D)->Unit
public common let lambda_d:(E)->Unit

// SEPARATE-FILE: p/p.cj
// EXEC-0: %compiler %noColor --experimental p/p.cj c/cmp.chir --common-part-cjo=./c/cmp.cjo --output-type=dylib --output-dir ./p
package cmp
public specific class A{
    public specific let a:Int64=1
    public let b:Int64=2
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
public specific let lambda_a:(A,A)->Int64={arg1:A,arg2:A=>arg1.a+arg2.b}
public specific let lambda_b:(B)->Int64={arg1:B=>arg1.b}
public specific let lambda_c:(C)->Unit={arg1:C=>arg1.foo()}
public specific let lambda_c2:(D)->Unit={arg1:D=>arg1.goo()}
public specific let lambda_d:(E)->Unit={arg1:E=>
        match(arg1){
            case ONE=> println("ONE")
            case TWO=> println("TWO")
            case THREE=> println("THREE")
        }
}
// SEPARATE-FILE: m_common.cj
// EXEC-0: %compiler %noColor m_common.cj --import-path=./p -L./p -lcmp -o %output
// (CJNATIVE and Linux)EXEC-PIPE: LD_LIBRARY_PATH=$LD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
// (CJNATIVE and Windows)EXEC-PIPE: set PATH=./p;%PATH% && %run %output 2>&1 | compare %f
// (CJNATIVE and Darwin)EXEC-PIPE: DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:./p %run %output 2>&1 | compare %f
import cmp.*
main(){
    let a:A=A()
    println(lambda_a(a,a))
    let b:B=B()
    println(lambda_b(b))
    let c:D=D()
    lambda_c(c)
    lambda_c2(c)
    let d:E=ONE
    lambda_d(d)
}
/*SCAN
3
2
class D foo
class D goo
ONE
*/