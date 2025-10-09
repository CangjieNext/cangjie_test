// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;

public class MyObject {
    public MyObject(boolean shouldThrow) throws Exception {
        System.out.println("MyObject(throwing: " + shouldThrow + ")");

        if (shouldThrow) {
            throw new Exception("java: MyObject()");
        }
    }


    public MyObject throwing() throws Exception {
        throw new Exception("java: throwing()");
    }
}
