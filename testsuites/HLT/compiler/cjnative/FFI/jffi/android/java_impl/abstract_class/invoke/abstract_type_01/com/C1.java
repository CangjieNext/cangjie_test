package com;

import com.example.myapplication.Logger;

public abstract class C1 {
  public C1() {
    Logger.println("in C1 init");
  }

  public int goo() {
    Logger.println("in C1 goo");
    return 66;
  }

  public static int bar() {
    Logger.println("in C1 bar");
    return 1;
  }

  public abstract C1 newoo(C1 c1);
}