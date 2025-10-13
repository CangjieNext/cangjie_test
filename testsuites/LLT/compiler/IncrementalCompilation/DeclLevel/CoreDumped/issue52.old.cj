class A <: Exception{}

class B {
    public var b : Int32 = 1
    public B(){
        throw A()
    }
}

class C{
    public C(){
        B()
    }
}


func test(){
    var res = -1
    try {
        C()
        ()
    } catch (a:A){
        res = 0
    } catch (e:Exception) {
        e.printStackTrace()
    }
    return res
}

main() {
    return test()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
