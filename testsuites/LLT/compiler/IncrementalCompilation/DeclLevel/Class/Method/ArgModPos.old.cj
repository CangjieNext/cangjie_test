class A {
    func foo(
        a
        : Int64)
    {}

    init    () 
    {}
    init(
        b 
        : Int32,
        c!: Int64,
        d!: (Int32,Int32) =
        (1,1)
    )
    {}
}

class CA{
    CA(
        f 
        : Int32,
        g 
        !: Int32,
        public let 
        h
        !: Int32,
        public var 
        i
        !: Int32,
        private let 
        j 
        !: (Int32, Int32)
        = (1,1)
    )
    {

    }

    prop too: Int64 {
        get 
        ()
        {1}
    }

    static mut 
    prop t2: Int64 {
        get 
        ()
        {1}

        set 
        (
            v 
        )
        {}
    }
}

struct B {
    B(
        a 
        : Int32,
        let
        b
        : Int64,
        var
        c 
        !: Int32,
        private let 
        e 
        !: Int64,
        public var 
        f 
        !: ?Int32 = 
        Some(3)
    )
    {}

    mut 
    prop t2: Int64 {
        get 
        ()
        {1}

        set 
        (
            v 
        )
        {}
    }
}

enum EC {
    R|K 

    func foo(
        a: Int32,
        b
        !: Int64
        ,
        c 
        !: (Int32) -> Unit =
        { _ => }
        )
    {
        println(3)
    }

    prop t2: Int64 {
        get 
            ()
        {
            return 1
        }
    }
}

main
(
    args
    : Array<String>
): Unit
{

}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
