// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.*;

public class Exe {
    public static JBase GetJBase() {
        return new JBase();
    }

    public void PrintString(String s) {
        System.out.println("[Java]PrintString: " + s);
    }

    public static void PrintStringStatic(String s) {
        System.out.println("[Java]PrintString: " + s);
    }
}
