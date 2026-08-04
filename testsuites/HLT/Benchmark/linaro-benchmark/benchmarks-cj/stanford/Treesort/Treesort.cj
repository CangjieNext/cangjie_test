/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*


class Node{
    public var left :Node = Node()
    public var right : Node = Node()
    public var val : Int64 = 0
    public var x : String = ""
}

class Treesort{
    public static let sortelements: Int64 = 5000
    public static let srtelements : Int64 = 500
    public var error : Bool =false
    public var seed :Int64 = 0
    public var sortlist : Array<Int64> = Array<Int64>(sortelements+1, repeat:0)
    public var biggest : Int64 = 0
    public var littleest : Int64 = 0
    public var top : Int64 = 0
    
    // Node tree

    public func Initrand(){
        seed = 74755
    }

    public func nodeString(x:Node):String{
        var z: String = ""
        z = x.toString()
        return z
    }

    public func Rand():Int64{
        seed = (seed*1309+13849) & 65535
        return seed
    }

    public func tInitarr(){
        var temp : Int64 = 0
        Initrand()
        biggest = 0
        littleest = 0
        for (i in 1..sortelements){
            temp = Rand()
            sortlist[i] = temp - (temp/100000)*100000 - 50000
            if (sortlist[i]> biggest){
                biggest = sortlist[i]
            }else if(sortlist[i]<littleest){
                littleest = sortlist[i]
            }
        }
    }

    public func CreateNode(n : Int64){
        var t : Node = Node()
        t.val = n
        return t
    }

    public func Insert(n :Int64, t :Node){
        if (n > t.val){
            if (Node().nodeString(t.left).isEmpty()){
                t.left = CreateNode(n)
            }else{
                Insert(n,t.left)
            }
        }else if(n < t.val){
            if (t.right = null){
                t.right = CreateNode(n)
            }else{
                Insert(n,t.right)
            }
        }
    }

    public func Checktree(p :Node):Bool{
        var result : Bool = false
        result = true
        if (p.left != null){
            if (p.left.val <= p.val){
                result = false
            }else{
                result = Checktree(p.left) && result
            }
        }
        if (p.right != null){
            if (p.right.val > p.val){
                result = false
            }else{
                result = Checktree(p.right) && result
            }
        }
        return result
    }

    public func Trees(run : Int64){
        tInitarr()
        var tree:Node = Node()
        tree.left = null
        tree.right = null
        tree.val = sortlist[1]
        for (i in 2..sortelements){
            Insert(sortlist[i],tree)
        }
        if (Checktree(tree) == true){
            error = true
        }
    }

    public func timeTreesort(iters : Int32){
        for (i in 0..iters){
            Trees(i)
        }
    }

    public func verify():Bool{
        var rp :Int32 = 1
        var obj:Treesort = Treesort()
        obj.timeTreesort(rp)
        return !obj.error
    }
}

main():Int64{
    var reps : Int32 = 2500
    var args = Process.current.arguments
    if (args.size == 1) {
        var num = Int32.tryParse(args[0])??0
        if (num != 0) {
            reps = num
        }
    }

    var obj : Treesort = Treesort()
    var startTime = DateTime.now()
    obj.timeTreesort(reps)
    var endTime = DateTime.now()
    var durTime = endTime - startTime
    var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

    if (obj.verify() == false) {
        print(perTime.format(".2") + "ns\n")
    } else {
        print("Error!\n")
    }

    return 0
}