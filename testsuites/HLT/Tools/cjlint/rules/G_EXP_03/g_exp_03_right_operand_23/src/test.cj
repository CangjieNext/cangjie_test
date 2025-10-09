var top_a = 10

func test(){
    var score: Int64 = 90
    let PASS = 60
    let FULL = 100

    var a = true && {
        => Int64({=> top_a; top_a}())
        true
    }()

    var b = true || {
        => Int64({=> top_a; top_a}())
        true
    }()

    var c = Option<Int64>.Some(100) ?? Int64({=> top_a; top_a}())

    var c1 = Option<Int32>.Some(100) ??  Int32({=> top_a; top_a}())

    var c2 = Option<Float64>.Some(100.0) ?? Float64({=> top_a; top_a}())

    var c3 = Option<Unit>.Some(()) ?? {
        => Int64({=> top_a; top_a}())
        ()
    }()

    var c4 = Option<String>.Some("100") ?? {
        => Int64({=> top_a; top_a}())
        "100"
    }()

    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? (Float64({=> top_a; top_a}()), "")

    var c6 = Option<Array<String>>.Some([""]) ?? {
        => Int64({=> top_a; top_a}())
        [""]
    }()

    let d = true &&  {
        => Int64({=> top_a; top_a}())
        true
    }()

    let e = true ||  {
        => Int64({=> top_a; top_a}())
        true
    }()

    let f = Option<Int64>.Some(100) ?? Int64({=> top_a; top_a}())
}

main(){

}


/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
