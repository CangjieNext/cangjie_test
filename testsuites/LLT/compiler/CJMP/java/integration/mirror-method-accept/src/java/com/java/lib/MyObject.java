// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

import cj.Impl;

public class MyObject {
    public MyObject() {
        System.out.println("MyObject()");
    }

    public int check() {
        return 5;
    }

    public void acceptMirror(MyObject obj) throws Exception {
        System.out.println("java: MyObject.acceptMirror(obj)");
        if (obj == null) throw new Exception("java: acceptMirror(obj): obj == null"); 
        if (obj.check() != this.check()) throw new Exception("java: acceptMirror(obj): obj is broken");
    }

    public void acceptImpl(Impl obj) throws Exception {
        System.out.println("java: MyObject.acceptImpl(obj)");
        if (obj == null) throw new Exception("java: acceptImpl(obj): obj == null"); 
        // if (obj.check() != this.check()) throw new Exception("java: acceptImpl(obj): obj is broken");
    }

    public void acceptInt(int i) throws Exception {
        System.out.println("java: MyObject.acceptInt()");
        if (i != 10) throw new Exception("java: acceptInt(i): i == " + i); 
    }

    public void acceptBool(boolean b) throws Exception {
        System.out.println("java: MyObject.acceptBool()");
        if (!b) throw new Exception("java: acceptBool(b): b == " + b); 
    }
}
