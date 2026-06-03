/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package com;

import com.example.myapplication.Logger;

import java.lang.ref.Cleaner;
import java.util.concurrent.atomic.AtomicInteger;;

public class SimpleJavaClass {

    private static final AtomicInteger counter = new AtomicInteger();
    private static final Cleaner cleaner = Cleaner.create();
    private final Cleaner.Cleanable cleanable;
    private final State state;

    public SimpleJavaClass() {
        this.state = new State();
        // 注册清理动作
        this.cleanable = cleaner.register(this, new CleaningAction(state));
        counter.incrementAndGet();
        // Logger.println("construct: " + SimpleJavaClass.counter.get());
    }

    private static class CleaningAction implements Runnable {

        private final State state;

        CleaningAction(State state) {
            this.state = state;
        }

        @Override
        public void run() {
            state.cleanup();
        }
    }

    private static class State {

        void cleanup() {
            // 实际清理逻辑
            counter.decrementAndGet();
            // Logger.println("destruct: " + SimpleJavaClass.counter.get());
        }
    }

    public static int getCounter() {
        return counter.get();
    }
    public void foo() {
      Logger.println("SimpleJavaClass.foo");
    }
}
