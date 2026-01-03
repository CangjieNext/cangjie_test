/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com.java.lib;
 
import cj.*;
 
public class Main {
    public static void main(String[] args) {
         Int32ToInt32 javaL0 = a -> a * 4;
         AInt32 a1 = new AInt32(javaL0, 5);
         Int32ToInt32 javaL = a -> a*3;
         Int32ToInt32 cjL = a1.test(5, javaL);
         System.out.println(cjL.call(10));

         Impl impl = new Impl();
         Int16ToFloat64 javaL2 = b -> b * 2.000000;
         Int16ToFloat64 l3 = impl.goo(javaL2);
         System.out.println(l3.call((short)5));

         SInt32 a2 = new SInt32(javaL0, 5);
         Int32ToInt32 javaL1 = a -> a * 3;
         Int32ToInt32 cjL1 = a2.test(5, javaL1);
         System.out.println(cjL1.call(10));

         TimeUnitInt32 t = TimeUnitInt32.Year(30);
         System.out.println(t.NumCalcMonth(7, javaL).call(1));
    } 
}