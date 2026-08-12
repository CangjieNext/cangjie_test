// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        Impl impl = new Impl();
        impl.acceptBool(true);
        impl.acceptInt(10);
        impl.acceptMirror(new MyObject());
        impl.acceptMirrorOption(new MyObject());
        impl.acceptImpl(impl);
        impl.acceptImplOption(impl);
    }
}
