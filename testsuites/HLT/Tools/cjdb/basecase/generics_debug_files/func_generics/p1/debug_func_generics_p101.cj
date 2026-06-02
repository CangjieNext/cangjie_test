/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

public func func_1<T>(a:T): T {
    var mydata = a
    return mydata
}

public func func_2<T1,T2>(a:T1,b:T2): T2 {
    let mydata_1 = a
    let mydata_2 = b
    return mydata_2
}

public func func_3<T1,T2>(a:T1,b:T2,c:T1): T1 {
    let mydata_1 = a
    let mydata_2 = b
    let mydata_3 = c
    return mydata_3
}

public func func_4<T1,T2,T3>(a:T1,b:T2,c:T3): T3 {
    let mydata_1 = a
    let mydata_2 = b
    let mydata_3 = c
    return mydata_3
}


