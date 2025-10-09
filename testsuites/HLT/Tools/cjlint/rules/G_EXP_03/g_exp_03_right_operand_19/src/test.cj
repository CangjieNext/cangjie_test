var top_a = 10

func test(){
    var score: Int64 = 90
    let PASS = 60
    let FULL = 100

    var a = true && {
        => while(top_a < 20){
            continue
        };
        true
    }()

    var b = true || {
        => while(top_a < 20){
            continue
        };
        true
    }()

    var c = Option<Int64>.Some(100) ?? {
        => while(top_a < 20){
            continue
        };
        100
    }()

    var c1 = Option<Int32>.Some(100) ??  {
        => while(top_a < 20){
            continue
        };
        Int32(100)
    }()

    var c2 = Option<Float64>.Some(100.0) ?? {
        => while(top_a < 20){
            continue
        };
        100.0
    }()

    var c3 = Option<Unit>.Some(()) ?? while(top_a < 20){
            top_a
        }

    var c4 = Option<String>.Some("100") ?? {
        => while(top_a < 20){
            continue
        };
        "100"
    }()

    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? {
        => while(top_a < 20){
            continue
        };
        (10.0, "")
    }()

    var c6 = Option<Array<String>>.Some([""]) ?? {
        => while(top_a < 20){
            continue
        };
        [""]
    }()

    let d = true &&  {
        => while(top_a < 20){
            continue
        };
        true
    }()

    let e = true ||  {
        => while(top_a < 20){
            continue
        };
        true
    }()

    let f = Option<Int64>.Some(100) ?? {
        => while(top_a < 20){
            continue
        };
        100
    }()
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
