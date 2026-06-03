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

class SuperClass {
  public long aByte = 1;
  public static short aShort = 1;

  public SuperClass(long aByte) {
    this.aByte = aByte;
  }

  public void foo() {
    Logger.println("Java-SuperClass-foo");
  }

  public static void goo() {
    Logger.println("Java-SuperClass-goo");
  }
}

public class Inherit extends SuperClass {
  private static final AtomicInteger counter = new AtomicInteger();
      private static final Cleaner cleaner = Cleaner.create();
    private final Cleaner.Cleanable cleanable;
    
    // 需要清理的资源
    private final State state;
  public Inherit(long aByte) {
    super(aByte);
    this.state = new State();
        // 注册清理动作
        this.cleanable = cleaner.register(this, new CleaningAction(state));
    counter.incrementAndGet();
  }

  @Override
  public void foo() {
    Logger.println("Java-Inherit-foo");
  }

  public static void goo() {
    Logger.println("Java-Inherit-goo");
  }
  protected void javaProtectedFunc() {
    Logger.println("Inherit.javaProtectedFunc");
  }
    // 清理动作（静态内部类，不持有外部类引用）
    private static class CleaningAction implements Runnable {
        private final State state;
        
        CleaningAction(State state) {
            this.state = state;
        }
        
        @Override
        public void run() {
            Logger.println("Cleaner: cleaning up...");
            counter.decrementAndGet();
            state.cleanup();
        }
    }
    
    private static class State {
        void cleanup() {
            // 实际清理逻辑
            Logger.println("State cleaned");
            counter.decrementAndGet();
        }
    }
  public static int getCounter() {
    return counter.get();
  }
}
