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
        Impl.get().check(); // Check that MyObject object is still alive

        initAndStoreAsOption();
        Impl.get().check(); // Check that MyObject object is still alive
    }

    private static void initAndStore() {
        MyObject mirror = new MyObject();
        Impl.store(mirror); // Write MyObject instance into variable in cangjie
        mirror.check();
    }

    private static void initAndStoreAsOption() {
        MyObject mirror = new MyObject();
        Impl.storeAsOption(mirror); // Write MyObject instance into variable in cangjie
        mirror.check();
    }

}
