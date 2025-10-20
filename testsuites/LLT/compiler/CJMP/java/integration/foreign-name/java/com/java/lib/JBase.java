// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class JBase {
    public static int idStatic = 37;

    public int id = 42;

    public static String getClassName() {
        return "JBase";
    }

    public String getName() {
        return "JBase.getName()";
    }
}
