/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default

func h1(){
    h1_1<Int64>()
    h1_2<Int64>(6)
    h1_2(8)
}

func h1_1<T>(){}
func h1_2<T>(a:T){}
