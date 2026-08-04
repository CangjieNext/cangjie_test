/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package reflect;

public class class_02 extends class_01 {
    public long v1 = 1;
    public static String v2 = "test";

    public class_02() {
        v2 = "";
    }

    public long foo1() {
        return 10;
    }

    public static long foo2() {
        return 10;
    }
}