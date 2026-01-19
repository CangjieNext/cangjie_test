// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

public interface SqlSource{

public func test(){
println("interface")
}
}

class AAA <: SqlSource {
    let aaa :SqlSource
    public init(para:SqlSource){
    aaa = para
}

public func test(){
    println("AAA")
}

}
class ccc <:SqlSource {
    public ccc(let preSql: String){}
}

func create(): SqlSource {
    let b = "123"
    return ccc(b)
}

var gl = 12

main()
{
    var a:SqlSource = AAA(create())
    a.test()
    0
}