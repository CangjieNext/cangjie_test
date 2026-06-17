/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import com.example.myapplication.Logger;
import UNNAMED.*;

// JavaChild与Impl定义在不同的Java包中
// 在JavaChild的构造方法中，只能通过super调用其父类Impl的构造方法
public class JavaChild extends Impl {
    public JavaChild() {
        super(114514);
        Logger.println("JavaChild.init()");
    }
}
