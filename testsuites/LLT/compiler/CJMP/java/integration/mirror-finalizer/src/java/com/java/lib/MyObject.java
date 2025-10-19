// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package com.java.lib;
 
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
 
public class MyObject {
    private static int finalizeCounter = 0;
    private static ReentrantLock lock = new ReentrantLock();
    private static Condition lockCond = lock.newCondition();
 
    public MyObject() throws InterruptedException {
        System.out.println("java: MyObject()");
    }
 
    public static int getFinalizeCounter() {
        return finalizeCounter;
    }
 
    public void foo() {
        System.out.println("java: MyObject.foo()");
    }
 
    public static void lock() {
        lock.lock();
    }
 
    public static void waitLock() throws InterruptedException {
        lockCond.await();
    }
 
    public static void notifyLock() {
        lockCond.signalAll();
    }
 
    public static void unlock() {
        lock.unlock();
    }
 
    protected void finalize() {
        lock.lock();
 
        finalizeCounter++;
        System.out.println("java: MyObject.finalize()");
 
        lockCond.signalAll();
        lock.unlock();
    }
}