// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    public static void main(String[] args) throws Exception {
        Impl impl = new Impl();

        boolean b = impl.retBool();
        if (!b) throw new Exception("Expected retBool() == true");

        int i = impl.retInt();
        if (i != 10) throw new Exception("Expected retInt() == 10, but was: " + i);

        MyObject m = impl.retMirror();
        if (m == null) throw new Exception("Expected retMirror() != null");

        MyObject mo = impl.retMirrorOption();
        if (mo == null) throw new Exception("Expected retMirrorOption() != null");

        MyObject mon = impl.retMirrorOptionNull();
        if (mon != null) throw new Exception("Expected retMirrorOptionNull() == null");

        Impl im = impl.retImpl();
        if (im == null) throw new Exception("Expected retImpl() != null");
        if (im != impl) throw new Exception("Expected retImplOption() == impl");

        Impl imo = impl.retImplOption();
        if (imo == null) throw new Exception("Expected retImplOption() != null");
        if (imo != impl) throw new Exception("Expected retImplOption() == impl");

        Impl imon = impl.retImplOptionNull();
        if (imon != null) throw new Exception("Expected retImplOptionNull() == null");
    }
}
