// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class cls<a:T, b:U>
{
    var m1:T
    var m2:U
    init(a:T, b:U) 
    {
        this.m1 = a
        this.m2 = b
        var aa = this.a
    }
    public func test() 
    {
        var ss = this.a
        ss
    }
}

main()
{
    var ss = cls<String, String>("ppp", "qqq")
    ss.test()
    0
}