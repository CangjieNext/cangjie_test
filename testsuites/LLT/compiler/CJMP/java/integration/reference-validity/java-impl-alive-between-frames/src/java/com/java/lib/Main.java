// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) {
        initAndStore();
        Impl.get().check(); // Check that impl object is still alive

        initAndStoreAsOption();
        Impl.get().check(); // Check that impl object is still alive
    }

    private static void initAndStore() {
        Impl impl = new Impl();
        Impl.store(impl); // Write Impl instance into variable in cangjie
        impl.check();
    }

    private static void initAndStoreAsOption() {
        Impl impl = new Impl();
        Impl.storeAsOption(impl); // Write Impl instance into variable in cangjie
        impl.check();
    }
}
