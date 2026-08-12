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

        // get null
        if (impl.getArrImpl(true, 0) != null) {
            throw new Exception("java: null array(Impl) is non-null");
        }

        if (!impl.wasImplArrCalled()) {
            throw new Exception("java: broken impl called flag");
        }
        impl.resetImplCalled();

        // get empty

        Impl[] empty = impl.getArrImpl(false, 0);

        if (!impl.wasImplArrCalled()) {
            throw new Exception("java: broken impl called flag");
        }
        impl.resetImplCalled();

        if (empty == null) {
            throw new Exception("java: empty array(Impl) is null");
        }

        if (empty.length != 0) {
            throw new Exception("java: empty array(Impl) size != 0");
        }

        // get regular array
        int size = 5;

        Impl[] regular = impl.getArrImpl(false, size);

        if (!impl.wasImplArrCalled()) {
            throw new Exception("java: broken impl called flag");
        }
        impl.resetImplCalled();

        if (regular == null) {
            throw new Exception("java: regular array(Impl) is null");
        }

        if (regular.length != size) {
            throw new Exception("java: regular array(Impl) size != " + size);
        }

        for (int i = 0; i < size; i++) {
            if (regular[i] != impl) {
                throw new Exception("java: regular array(Impl)[" + i + "] is broken");
            }
        }

    }
}
