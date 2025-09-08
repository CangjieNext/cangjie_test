open class Base{
    open public func foo(){
        return 0
    }
}

open class Derive <: Base{
    public open func foo(){
        return 10
    }



}

class Derive2 <: Derive{
    public open func bar(){
        return 100
    }
}

func useDFoo(){
    let b:Base = Derive()
    b.foo()
}

func useD2Bar(){
    let b:Derive2 = Derive2()
    b.bar()
}
func useD2Foo(){
    let b:Derive2 = Derive2()
    b.foo()
}

main() {
    return useDFoo() + useD2Bar() + useD2Foo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
