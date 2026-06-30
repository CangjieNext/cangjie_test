// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        Impl impl1 = new Impl(5, true);
        Impl impl2 = new Impl(new FakeObject(), new MyObject());
        Impl impl3 = new Impl(new FakeObject());
        Impl impl4 = new Impl(null);
    }
}
