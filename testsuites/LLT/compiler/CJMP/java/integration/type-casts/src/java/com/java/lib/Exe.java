// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.*;

public class Exe {
    public static JBase getJBase(int t) {
        switch (t) {
            case 0:
                return new JBase();
            case 1:
                return new JDer();
            case 2:
                return new CjDer();
            case 3:
                return new CjBaseDer();
        }
        throw new RuntimeException("Unknown type " + t);
    }

    public static JDer getJDer(int t) {
        switch (t) {
            case 1:
                return new JDer();
            case 2:
                return new CjDer();
        }
        throw new RuntimeException("Unknown type " + t);
    }

    public static JBase getCj(int t, int x) {
        switch (t) {
            case 1:
                return new CjDer(x);
            case 3:
                return new CjBaseDer(x);
        }
        throw new RuntimeException("Unknown type " + t);
    }

    public static JBase getJDerValue(int x) {
        return new JDerValue(x);
    }

    public static JBase getCjDerValue(int x) {
        return new CjDerValue(x);
    }
}
