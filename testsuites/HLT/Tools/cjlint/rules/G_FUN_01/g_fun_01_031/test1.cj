/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func test1(i:Int64){
    if (i < 1){
        if (i < 1){
            if (i < 1){
                print(i)
            }
        }
    }
}
func test(){
    var a = [1,2,3]
    for (i in a){
        if (i < 1){
            test1(i)
        }
    }
}

main(){

}

