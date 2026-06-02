/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func returnFunc(para_1:Int64,para_2!:(Int64,Int32)=(1,2)){
        return 0
}

func returnFunc_2(para_1:Int64,para_2!:Array<Int64>=[1,2]){
        return 0
}

func returnFunc_3(para_1:Int64,para_2!:Int64=1){
        return 0
}

func returnFunc_4(para_1:Int64,para_2!:String="仓颉test"){
        return 0
}

func returnFunc_5(para_1:Int64,para_2!:Bool=true){
        return 0
}

func returnFunc_6(para_1:Int64,para_2!:Unit=()){
        return 0
}

func returnFunc_7(para_1:Int64,para_2!:Range<Int64>=0..5:1){
        return 0
}

func returnFunc_8(para_1:Int64,para_2!:Rune=r'C'){
        return 0
}

main(){
        returnFunc(2)
        returnFunc_2(2)
	returnFunc_3(2)
	returnFunc_4(2)
	returnFunc_5(2)
	returnFunc_6(2)
	returnFunc_7(2)
	returnFunc_8(2)
        return 0
}
