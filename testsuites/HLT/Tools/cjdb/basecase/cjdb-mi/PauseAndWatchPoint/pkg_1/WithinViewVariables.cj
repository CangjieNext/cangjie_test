/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package pkg_1

public class Clazz{
    let mI1:Int8 = -8
    var mI2:Int16 = -16
    var mI3:Int32 = -32
    var mI4:Int64 = -64

    var mUI1:UInt8 = 8
    let mUI2:UInt16 = 16
    var mUI3:UInt32 = 32
    var mUI4:UInt64 = 64

    var mF1:Float16 = 8.16
    let mF2:Float32 = 32.32002
    var mF3:Float64 = 64.64332459

    var mC1:Rune = 'C'
    var mB1:Bool = 1==2

    public Clazz(v1:Int32){
        this.mI3 = v1
    }

    public  func getBaseType():((Int8,Int16,Int32,Int64),(UInt8,UInt16,UInt32,UInt64),(Float16,Float32,Float64),(Bool,Rune)){
        let tuple_I:(Int8,Int16,Int32,Int64) = (mI1,mI2,mI3,mI4)
        let tuple_UI:(UInt8,UInt16,UInt32,UInt64) = (mUI1,mUI2,mUI3,mUI4)
        let tuple_F:(Float16,Float32,Float64) = (mF1,mF2,mF3)
        let tuple_O:(Bool,Rune) = (mB1,mC1)
        var res:((Int8,Int16,Int32,Int64),(UInt8,UInt16,UInt32,UInt64),(Float16,Float32,Float64),(Bool,Rune)) = (tuple_I,tuple_UI,tuple_F,tuple_O)

        return res
    }

}

main(){
    let cla_ins:Clazz =Clazz(69)
    var data = cla_ins.getBaseType() //((Int8,Int16,Int32,Int64),(UInt8,UInt16,UInt32,UInt64),(Float16,Float32,Float64),(Bool,Rune))
    var v1 :(Int8,Int16,Int32,Int64) = data[0] //
    var vm1 :Int8 = v1[0]
    var vm2 :Int32 = v1[2]
    vm1 = 12
    vm2 = -12
    var v2 :(UInt8,UInt16,UInt32,UInt64) = data[1]
    vm2 = -12
    var vm3 :UInt16 = v2[1]
    vm2 = Int32(vm1)
    var vm4 :UInt64 = v2[3] + UInt64(vm3)
    vm3 = 12
    vm4 = 12
    var v3 :(Float16,Float32,Float64) = data[2]
    var vm5 :Float16 = v3[0]
    var vm6 :Float64 = v3[2] //初始化后值未变更
    vm5 = 12.212 + vm5
    var v4 :(Bool,Rune) = data[3]
    vm5 = -32.132
    var vm7 :Bool = v4[0]
    var vm8 :Rune = v4[1]
    vm8 = 'C'
    vm8 = 'c'
    vm7 = 'c' is Rune
    vm7 = 'c' is Rune && !vm7





    return 0
}

