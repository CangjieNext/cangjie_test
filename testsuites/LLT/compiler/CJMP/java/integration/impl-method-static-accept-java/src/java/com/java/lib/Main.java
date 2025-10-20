// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        Impl.acceptBool(true);
        Impl.acceptInt(10);
        Impl.acceptMirror(new MyObject());
        Impl.acceptMirrorOption(new MyObject());
        Impl impl = new Impl();
        Impl.acceptImpl(impl);
        Impl.acceptImplOption(impl);
    }
}
