/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package org5::pkgs

public enum T1<X> {
    Year|Month|Day
    public func f1(par_1:X):X {
        var var_m1 =par_1
        let var_m2 =par_1
        return var_m1
    }

    public static func fun_s1(par_1:X):X {
        var var_s1 =par_1
        return var_s1
    }
}


public interface I1 {
    public func f1(){}
}

public class C1 <: I1{
    public func f2(){}
    public static func f3(){}
}