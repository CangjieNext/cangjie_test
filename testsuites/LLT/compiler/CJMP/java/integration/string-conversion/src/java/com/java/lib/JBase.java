// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class JBase {
    public String GetArgJString(String arg) {
       System.out.println("Java got: " + arg);
       return arg;
    }

    public String GetJString() {
        return "foo";
    }

    public String GetJStringOption() {
        return "foo";
    }
}
