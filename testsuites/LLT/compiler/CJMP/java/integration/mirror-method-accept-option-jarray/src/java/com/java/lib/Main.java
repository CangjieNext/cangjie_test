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

        if (!impl.isNull((Impl[]) null)) {
            throw new Exception("java: null array is non-null");
        }

        Impl[] arr = new Impl[1];
        if (impl.isNull(arr)) {
            throw new Exception("java: non-null array is null");
        }

        if (!impl.wasImplNullCalled()) {
            throw new Exception("java: impl isNull overload was not called");
        }

    }
}
