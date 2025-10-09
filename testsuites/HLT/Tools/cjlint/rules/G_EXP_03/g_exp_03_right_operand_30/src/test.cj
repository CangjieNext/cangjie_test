import std.sync.*

var top_a = 10

func test(){
    let mtx : ReentrantMutex = ReentrantMutex()

    var a = true && synchronized(mtx) {
        top_a++
        true
    }

    var b = true || synchronized(mtx) {
        top_a++
        true
    }

    var c = Option<Int64>.Some(100) ?? 
        synchronized(mtx) {
            top_a++
            1
        }

    var c1 = Option<Int32>.Some(100) ??  
        synchronized(mtx) {
            top_a++
            Int32(2)
        }

    var c2 = Option<Float64>.Some(100.0) ?? 
        synchronized(mtx) {
            top_a++
            1.0
        }

    var c3 = Option<Unit>.Some(()) ?? 
        synchronized(mtx) {
            top_a++
            ()
        }

    var c4 = Option<String>.Some("100") ?? 
        synchronized(mtx) {
            top_a++
            "100"
        }

    var c5 = Option<(Float64,String)>.Some((10.0, "")) ??
        synchronized(mtx) {
            top_a++
            (0.0, "100")
        }

    var c6 = Option<Array<String>>.Some([""]) ?? 
        synchronized(mtx) {
            top_a++
            [""]
        }

    let d = true &&  
        synchronized(mtx) {
            top_a++
            true
        }

    let e = true ||  
        synchronized(mtx) {
            top_a++
            true
        }
        

    let f = Option<Int64>.Some(100) ?? 
        synchronized(mtx) {
            top_a++
            1
        }

    let g = Option<Int64>.Some(synchronized(mtx) { 1+ 2}) ??  
        synchronized(mtx) {
            top_a++
            top_a
        }
        
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
