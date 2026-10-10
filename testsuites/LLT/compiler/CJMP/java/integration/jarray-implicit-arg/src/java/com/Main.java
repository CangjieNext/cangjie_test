// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com;

import java.lang.reflect.Method;
import java.util.Arrays;

import g.*;

class Main {
    public static void main(String[] args) {
        Impl x = new Impl();

        Arrays.stream(x.getClass().getMethods())
            .filter(m -> m.getName().startsWith("get"))
            .filter(m -> m.getParameterCount() == 0)
            .filter(m -> m.getReturnType().isArray())
            .forEach(method -> {
                method.setAccessible(true);
                try {
                    printArrayComponentType(method.invoke(x));
                } catch (Exception e) {
                    throw new RuntimeException("Failed to invoke " + method.getName(), e);
                }
            });

        System.out.println("java end");
    }

    public static void printArrayComponentType(Object array) {
        if (array == null) {
            System.out.println("Input is null");
            return;
        }
        Class<?> clazz = array.getClass();
        if (!clazz.isArray()) {
            System.out.println("Input is not an array");
            return;
        }
        Class<?> componentType = clazz.getComponentType();
        System.out.println("Array component type: " + componentType.getName());
    }
}
