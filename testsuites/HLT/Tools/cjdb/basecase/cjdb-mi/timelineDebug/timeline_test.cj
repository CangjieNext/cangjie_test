/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

public class Cla{
    public init(){}
    let tuple_I:(Int8,Int16,Int32,Int64) = (-8,16,-32,64)
    let tuple_UI:(UInt8,UInt16,UInt32,UInt64) = (8,165,3206,64521)
    let tuple_F:(Float32,Float64) = (32.32,64.64)
    let tuple_O:(Bool,Rune) = (true,'C')

    public func fun_cla1(){
    let v1 = this.tuple_I[2]
    return v1
    }
}

class AA {
    let width: Int64
    let height: Int64

    public init(width: Int64, height: Int64) {
        this.width = width
        this.height = height
    }
    public func area() {
        width * height
    }
}

func coroutine1() {
    let fut1 = spawn {
         =>
        let claIns1:Cla = Cla()
        var vm_1:Int8 = claIns1.tuple_I[0] //(Int8):-8
        var vm_2:Int16 = claIns1.tuple_I[1] //(Int16):16
        var vm_3:Int32 = claIns1.tuple_I[2] //(Int32):-32
        let vm_4:Int64 = claIns1.tuple_I[3] //(Int64):64

        let vm_5:UInt8 = claIns1.tuple_UI[0] //(UInt8):8
        var vm_6:UInt16 = claIns1.tuple_UI[1] //(UInt16):165
        var vm_7:UInt32 = claIns1.tuple_UI[2] //(UInt32):3206
        let vm_8:UInt64 = claIns1.tuple_UI[3] //(UInt64):64521

        let vm_9:Float32 = claIns1.tuple_F[0] //(Float32):32.32
        var vm_10:Float64 = claIns1.tuple_F[1] //(Float64):64.64

        var vm_11:Bool = claIns1.tuple_O[0] //(Bool):true
        let vm_12:Rune = claIns1.tuple_O[1] //(Rune):'C'
        var vm_13:Float16 = 1.016 //(Float16):1.016
    }
    return fut1
}

func coroutine2(count: AtomicInt32) {
    let fut2 = spawn {
         => 
        count.fetchAdd(1)
        count.fetchSub(1)
    }
    return fut2
}

func coroutine3() {
    let fut3 = spawn {
         =>
        var aa: AA = AA(10, 10)
        var area = aa.area()
        println("area: ${area}")
    }
    return fut3
}

main() {
    // Coroutine1: show variables
    let fut1 = coroutine1()
    fut1.get()

    // Coroutine2: Atomic operation
    var count2: AtomicInt32 = AtomicInt32(0)
    let fut2 = coroutine2(count2)
    fut2.get()
    println("count: ${count2.load()}")

    // Coroutine3: class
    let fut3 = coroutine3()

    for (i in 0..10){
        let fut = coroutine1()
        fut.get()
    }
    
    fut3.get()
}
