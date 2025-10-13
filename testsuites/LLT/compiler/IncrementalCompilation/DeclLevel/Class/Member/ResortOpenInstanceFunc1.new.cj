open class C{
    public open func b(){
        return 1
    }
    public open func a(){
        return -1
    }
}

class D <: C{

}

let c = C()

func useA(){
    return c.a()
}

func useB(){
    return c.b()
}

func useType(){
    let c:C
}

main() {
    return useA() + useB()
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
