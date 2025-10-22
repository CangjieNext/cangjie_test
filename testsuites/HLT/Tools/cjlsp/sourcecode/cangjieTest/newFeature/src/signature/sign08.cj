/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

func ff8(x:Float64,y:Float64):Float64{
    return x*y
}

func ff9(x:Float64,y:Float64):Float64{
    return x*y
}

func test9(){
    ff8(1.0,ff9(1.2,33.0))
}
