// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class student{
    public var name=""
    public init(sname:String){
    this.name=sname
    }

    public func combine (a:String,b:String) :String
    {
    return (a+b)
    }

}

main(): Int64 {
let s1="hello world"
let s2="test_\${s1}"
var zhy: student =student("charl")
print("${zhy.combine("hello","world")}")
print("${deserialize("true")}")
return 0
}
