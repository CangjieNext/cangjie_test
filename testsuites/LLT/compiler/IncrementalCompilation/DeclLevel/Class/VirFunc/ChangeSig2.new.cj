open class Base{
    public func foo(a:Int64):Int64{
        return 1
    }
}

open class Derive <: Base{
    public func foo():Int64{
        return 10
    }
}

func useBFoo():Int64{
    let b:Base = Base()
    b.foo(2)
}

func useDFoo():Int64{
    let d:Derive = Derive()
    d.foo()
}

main() {
    return useBFoo() + useDFoo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
