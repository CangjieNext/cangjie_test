open class Base{
    open public prop foo:Int64{
        get(){
            return 0
        }
    }
    open public prop fuzz:Int64{
        get(){
            return 0
        }
    }
}

open class Derive <: Base{
    public prop foo:Int64{
        get(){
            return 10
        }
    }
    public prop fuzz:Int64{
        get(){
            return 100
        }
    }
}

func useBFoo(){
    let b = Base()
    b.foo
}

func useDFoo(){
    let b:Base = Derive()
    b.foo
}

main() {
    return useBFoo() + useDFoo()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
