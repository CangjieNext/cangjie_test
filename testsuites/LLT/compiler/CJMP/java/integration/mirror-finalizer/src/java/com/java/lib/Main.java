// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;
 
import javax.management.RuntimeErrorException;
 
import cj.Impl;
 
public class Main {
    public static void main(String[] args) throws InterruptedException {
        System.out.println("java: main()");
 
        Thread testThread = new Thread(() -> {
            Impl.test();
            try {
                while (!Impl.hasCjGCCollected()) {
                    Thread.sleep(100L);
                }
            } catch(InterruptedException e) {
                throw new RuntimeException(e);
            }
            Runtime.getRuntime().gc();
        });
        testThread.start();
        testThread.join();
 
        check();
 
        System.out.println("java: main() end");
    }
 
    private static void check() throws InterruptedException {
        MyObject.lock();
        while (MyObject.getFinalizeCounter() != 1) {
            MyObject.waitLock();
        }
        MyObject.unlock();
    }
}