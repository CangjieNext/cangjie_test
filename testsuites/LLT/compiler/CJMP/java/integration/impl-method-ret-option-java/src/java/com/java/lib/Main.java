// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class Main {
    private static final long OBJ_CHECK = 5;
    private static final long IMPL_CHECK = 6;
    public static void main(String[] args) {
        Impl impl = new Impl();

        testNull(impl);
        testSelf(impl);
        testSelfSome(impl);

        testObjNull(impl);
        testObj(impl);
        testObjSome(impl);
    }

    private static void testNull(Impl impl) {
        System.out.println("java: test null");

        Impl none = impl.getSelfNone();
        if (none != null) {
            throw new RuntimeException("java: getSelfNone() returned not null");
        }

        System.out.println("java: test null end");
    }

    private static void testSelf(Impl impl) {
        System.out.println("java: test self");

        Impl self = impl.getSelf();
        if (self == null) {
            throw new RuntimeException("java: getSelf() returned null");
        }

        long selfcheck = self.check();
        if (selfcheck != IMPL_CHECK) {
            throw new RuntimeException("java: getSelf().check (" + selfcheck + ") != " + IMPL_CHECK);
        }

        System.out.println("java: test self end");
    }

    private static void testSelfSome(Impl impl) {
        System.out.println("java: test selfSome");

        Impl self = impl.getSelfSome();
        if (self == null) {
            throw new RuntimeException("java: getSelfSome() returned null");
        }

        long selfcheck = self.check();
        if (selfcheck != IMPL_CHECK) {
            throw new RuntimeException("java: getSelfSome().check (" + selfcheck + ") != " + IMPL_CHECK);
        }

        System.out.println("java: test selfSome end");
    }

    private static void testObjNull(Impl impl) {
        System.out.println("java: test obj null");

        MyObject none = impl.getObjNone();
        if (none != null) {
            throw new RuntimeException("java: getObjNone() returned not null");
        }

        System.out.println("java: test obj null end");
    }

    private static void testObj(Impl impl) {
        System.out.println("java: test obj");

        MyObject obj = impl.getObj();
        if (obj == null) {
            throw new RuntimeException("java: getObj() returned null");
        }

        long objcheck = obj.check();
        if (objcheck != OBJ_CHECK) {
            throw new RuntimeException("java: testObj().check (" + objcheck + ") != " + OBJ_CHECK);
        }

        System.out.println("java: test obj end");
    }

    private static void testObjSome(Impl impl) {
        System.out.println("java: test obj some");

        MyObject obj = impl.getObjSome();
        if (obj == null) {
            throw new RuntimeException("java: getObjSome() returned null");
        }

        long objcheck = obj.check();
        if (objcheck != OBJ_CHECK) {
            throw new RuntimeException("java: testObj().check (" + objcheck + ") != " + OBJ_CHECK);
        }

        System.out.println("java: test obj some end");
    }
}
