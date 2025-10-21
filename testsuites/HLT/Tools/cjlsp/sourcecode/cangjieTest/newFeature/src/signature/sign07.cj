/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

@When[os=="windows"]
func ff7(x:Int64,y!:Float32){

}

func f8(){
    var y1 = ff7(1, y: 3.2444442111125696967)
    var y2 = ff7(1,y:222.3)
}
