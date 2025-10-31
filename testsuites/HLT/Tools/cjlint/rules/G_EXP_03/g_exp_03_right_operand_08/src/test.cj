/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

var top_a = 10

func test(){
    var score: Int64 = 90
    let PASS = 60
    let FULL = 100

    var a = true && match (score) {
        case 0 => true
        case 10 | 20 | 30 | 40 | 50 => true
        case 70 | 80 => true
        case 90 => top_a; true // matched
        case _ => false
    }

    var b = true || match (score) {
        case 0 => true
        case 10 | 20 | 30 | 40 | 50 => true
        case 70 | 80 => true
        case 90 => top_a; true // matched
        case _ => false
    }

    var c = Option<Int64>.Some(100) ??  match (score) {
        case 0 => 1
        case 10 | 20 | 30 | 40 | 50 => 1
        case 70 | 80 => 1
        case 90 => top_a; 1 // matched
        case _ => 1
    }

    var c1 = Option<Int32>.Some(100) ??  match (score) {
        case 0 => 2
        case 10 | 20 | 30 | 40 | 50 => 2
        case 70 | 80 => 2
        case 90 => top_a; 2 // matched
        case _ => 2
    }

    var c2 = Option<Float64>.Some(100.0) ??  match (score) {
        case 0 => 1.0
        case 10 | 20 | 30 | 40 | 50 => 1.0
        case 70 | 80 => 1.0
        case 90 => top_a; 1.0 // matched
        case _ => 1.0
    }

    var c3 = Option<Unit>.Some(()) ??  match (score) {
        case 0 => ()
        case 10 | 20 | 30 | 40 | 50 => ()
        case 70 | 80 => ()
        case 90 => top_a; () // matched
        case _ => ()
    }
    var c4 = Option<String>.Some("100") ??  match (score) {
        case 0 => "1.0"
        case 10 | 20 | 30 | 40 | 50 => "1.0"
        case 70 | 80 => "1.0"
        case 90 => top_a; "1.0" // matched
        case _ => "1.0"
    }

    var c5 = Option<(Float64,String)>.Some((10.0, "")) ?? match (score) {
        case 0 => (10.0, "")
        case 10 | 20 | 30 | 40 | 50 => (10.0, "")
        case 70 | 80 => (10.0, "")
        case 90 => top_a; (10.0, "") // matched
        case _ => (10.0, "")
    }

    var c6 = Option<Array<String>>.Some([""]) ?? match (score) {
        case 0 => [""]
        case 10 | 20 | 30 | 40 | 50 => [""]
        case 70 | 80 => [""]
        case 90 => top_a; [""] // matched
        case _ => [""]
    }

    let d = true &&  match (score) {
        case 0 => true
        case 10 | 20 | 30 | 40 | 50 => true
        case 70 | 80 => true
        case 90 => top_a; true // matched
        case _ => false
    }

    let e = true ||  match (score) {
        case 0 => true
        case 10 | 20 | 30 | 40 | 50 => true
        case 70 | 80 => true
        case 90 => top_a; true // matched
        case _ => false
    }

    let f = Option<Int64>.Some(100) ?? match (score) {
        case 0 => 1
        case 10 | 20 | 30 | 40 | 50 => 1
        case 70 | 80 => 1
        case 90 => top_a; 1 // matched
        case _ => 1
    }
}

main(){

}



