/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com.java.lib;
import cj.*;

public class BChild extends B {
    @Override
    public Int32ToInt32 testLambda(Int32ToInt32 a) {
        System.out.println("Java: at java BChild, fun param ret: " + a.call(2));
        Int32ToInt32 ret = c -> c * 4;
        return ret;
    }
}
