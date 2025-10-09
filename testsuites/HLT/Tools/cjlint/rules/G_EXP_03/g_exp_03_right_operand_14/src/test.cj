var top_a = 10

func test(){
    let intList: Array<Int32> = [0, 1, 2, 3, 4]

    var a = true && {
        => for (item in intList) {
            top_a 
        }
        true
    }()


    var b = true || {
        => for (item in intList) {
            top_a 
        };
        true
    }()

    var c = Option<Int64>.Some(100) ?? {
        => for (item in intList) {
            top_a 
        };
        100
    }()

    var c1 = Option<Int32>.Some(100) ??  {
        => for (item in intList) {
            top_a 
        };
        Int32(100)
    }()

    var c2 = Option<Float64>.Some(100.0) ?? {
        => for (item in intList) {
            top_a 
        };
        100.0
    }()

    var c3 = Option<Unit>.Some(()) ?? for (item in intList) {
            top_a 
        }

    var c4 = Option<String>.Some("100") ?? {
        => for (item in intList) {
            top_a 
        };
        "100"
    }()

    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? {
        => for (item in intList) {
            top_a 
        };
        (10.0, "")
    }()

    var c6 = Option<Array<String>>.Some([""]) ?? {
        => for (item in intList) {
            top_a 
        };
        [""]
    }()

    let d = true &&  {
        => for (item in intList) {
            top_a 
        };
        true
    }()

    let e = true ||  {
        => for (item in intList) {
            top_a 
        };
        true
    }()

    let f = Option<Int64>.Some(100) ?? {
        => for (item in intList) {
            top_a 
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
