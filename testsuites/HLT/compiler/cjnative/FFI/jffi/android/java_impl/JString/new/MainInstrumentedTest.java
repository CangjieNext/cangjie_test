/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com.example.myapplication;

import static org.junit.Assert.*;

import java.io.PrintStream;
import java.util.concurrent.TimeUnit;

import android.util.Log;

import androidx.test.ext.junit.runners.AndroidJUnit4;
import org.junit.Test;
import org.junit.runner.RunWith;

import com.example.myapplication.JavaChild;
import com.example.myapplication.Main;

import UNNAMED.*;
import com.Inherit;
import com.SimpleJavaClass;


class LogOutputStream extends java.io.OutputStream {
        private final String tag;
        private final int priority;
        private final StringBuilder buffer = new StringBuilder();
        
        public LogOutputStream(String tag, int priority) {
            this.tag = tag;
            this.priority = priority;
        }
        
        @Override
        public void write(int b) {
            char c = (char) b;
            if (c == '\n') {
                flushBuffer();
            } else {
                buffer.append(c);
            }
        }
        
        private void flushBuffer() {
            if (buffer.length() > 0) {
                android.util.Log.println(priority, tag, buffer.toString());
                buffer.setLength(0);
            }
        }
    }

@RunWith(AndroidJUnit4.class)
public class MainInstrumentedTest {
  @Test
  public void test00() throws  InterruptedException {
    System.setOut(new PrintStream(new LogOutputStream("APP_OUTPUT", Log.DEBUG)));
    System.out.println("hello world!");

    Main.main(new String[] {});
    JavaChild i = new JavaChild();
    assertEquals(i.protectedFunc(), 1);
    
    for (int ii = 0; ii < 1; ii++) {
      Impl c = new Impl();
      assertEquals(c.bar("hello"), "hello");
      assertEquals(c.bar1("world"), "world");
      // assertEquals(c.getP(), "world");
      // assertEquals(c.getP1(), "world");
      // assertEquals(c.v0, "world");
      // assertEquals(c.v1, "world");
      c.checkEscape();
    }

    for (int iii = 0; iii < 10; iii++) {
      Logger.println("checking..." + SimpleJavaClass.getCounter());
      System.gc();
      System.runFinalization();
      Impl.callCangjieGC();
      TimeUnit.SECONDS.sleep(1);
    }
  }
}
