/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package testFunctype
func hh1(){
    hh1_1<Int64>()
    hh1_2<Int64>(6)
    hh1_2(8)
}

func hh1_1<T>(){}
func hh1_2<T>(a:T){}

class VVP{}
