/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
package com.java.lib;
import cj.*;

public class IImpl implements I{
    @Override
    public Int32ToInt32 test(Int32ToInt32 fun) {
        System.out.println("Java: IImpl test(): " + fun.call(10));
        Int32ToInt32 ret = b->b -10;
        return ret;
    }
}
