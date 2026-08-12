/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.io.*;
import java.time.Duration;
import java.time.LocalDateTime;
import java.util.Collections;
import java.util.ArrayList;
import java.util.Arrays;

public class AddAndCountObjects {

    static class A {
        long x1 = 1;
    }
    
    static class B {
        long x1 = -1;
    }
    
    public static void main(String[] args) {
        var start_total = System.nanoTime();
        ArrayList<A> className1 = new ArrayList<>();
        ArrayList<B> className2 = new ArrayList<>();

        long num_total = 0;

        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        
        for (int j = 0; j < 5000000; ++j) {
            className1.add(new A());
            className2.add(new B());
        }
        try {
            Thread.sleep(1000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        num_total = num_total + className1.size() + className2.size();
        long end_total = System.nanoTime();
        System.out.println("AddAndCountObjects: ms = " + (end_total - start_total) / 1000000.0);
        System.out.println(num_total);
        return;
    }
}
