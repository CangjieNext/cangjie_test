// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public abstract class AbstractMirror {
    public static void staticFunc() {
        System.out.println("Java: static func");
    }
    protected abstract void abstractFunc();
    
    public void instanceFunc() {
        System.out.println("Java: Hello from instance func");
    }
}