// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.*;

public class Main {
    public static void main(String[] args) {
        System.out.println("Case 1:");
        TimeUnit.Month.CalcMonth();
        TimeUnit.Year.CalcMonth();
        TimeUnit.Month(36).CalcMonth();
        TimeUnit.Year(2).CalcMonth();
        TimeUnit.TenYear().CalcMonth();
        System.out.println(TimeUnit.TenYear().getItem());
        TimeUnit.TenYear().getToMonth().CalcMonth(); // x has 120 months
        System.out.println(TimeUnit.KindOfTime(TimeUnit.Year(2).getToMonth())); // 2

        System.out.println("Case 2:");
        System.out.println("Expected result : 2, Actual : " + Expr.Num(2).eval()); // 2
        System.out.println("Expected result : 7, Actual : " + Expr.Add(Expr.Num(2), Expr.Num(5)).eval()); // 7
        System.out.println(
                "Expected result : 3, Actual : " + Expr.Sub(Expr.Num(10), Expr.Add(Expr.Num(2), Expr.Num(5))).eval()); // 3
    }
}

