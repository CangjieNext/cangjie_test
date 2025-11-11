/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var top_a = 10
class A {
    public init(){
        var a = true && {
            super(top_a)
            true
        }()

        var b = true || {
            super(top_a)
            true
        }()

        var c = Option<Int64>.Some(100) ?? super(top_a)

        var c1 = Option<Int32>.Some(100) ??  super(top_a)

        var c2 = Option<Float64>.Some(100.0) ?? super(top_a)

        var c3 = Option<Unit>.Some(()) ?? {
            super(top_a)
            ()
        }()

        var c4 = Option<String>.Some("100") ?? {
            super(top_a)
            "100"
        }()

        var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? super(top_a)

        var c6 = Option<Array<String>>.Some([""]) ?? {
            super(top_a)
            [""]
        }()

        let d = true &&  {
            super(top_a)
            true
        }()

        let e = true ||  {
            super(top_a)
            true
        }()

        let f = Option<Int64>.Some(100) ?? super(top_a)
    }

    public init(a : Int64){

    }
}

func test(){

}

main(){

}



