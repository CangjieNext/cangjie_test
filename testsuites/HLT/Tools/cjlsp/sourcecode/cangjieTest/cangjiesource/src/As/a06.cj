/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.As

//函数名作为表达式
func add(x:Int16,y:Int16):Int16 { return x+y }
var f1 = add(1,2) as Int16

func identify<T>(a:T) {
    return a
}

var f2 =identify<Int16> as Int16
