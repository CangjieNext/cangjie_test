/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package p1

// 同包不同文件方法调用
public func func_p102<T>(a:T): T {
    var data_1 = func_1<Int64>(100)
    print("I am in debug_func_generics_p102.\n")
    return a
}

