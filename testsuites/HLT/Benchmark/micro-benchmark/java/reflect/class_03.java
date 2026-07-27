/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package reflect;

// 类 class_03 继承 class_02 并实现 ToString 和 I1
public class class_03 extends class_02 implements I1 {

    @Override
    public long foo1() {
        return 100;
    }

    public static long foo2() {
        return 100;
    }

    // 重写 toString 方法（必须）
    @Override
    public String toString() {
        return "class_03";
    }
}