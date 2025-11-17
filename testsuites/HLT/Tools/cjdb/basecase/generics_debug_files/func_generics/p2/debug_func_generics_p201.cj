/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p2
import p1.*

public func func_p201<T>(a:T):T{
    var data_p201 = func_3<Rune,String>(r'A',"Cangjie",r'A')
    var data_p202 = func_p102<Array<Int64>>([1,2,3])
    print("I am in debug_func_generics_p201.\n")
    return a
}
