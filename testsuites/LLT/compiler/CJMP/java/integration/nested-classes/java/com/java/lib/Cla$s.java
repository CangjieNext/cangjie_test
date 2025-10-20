// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class Cla$s {
    public static class Inner {
        String outerName = "Cla$s.Inner";

        public class InnerClas$ {
            @Override
            public String toString() {
                return "[2] " + outerName + ".InnerClas$";
            }
        }

        @Override
        public String toString() {
            return "[1] Cla$s.Inner";
        }
    
        public InnerClas$ getInner() {
            return new InnerClas$();
        }
    }

    @Override
    public String toString() {
        return "[0] Cla$s";
    }
}
