package com;

public abstract class C1 {
  public C1() {
    System.out.println("in C1 init");
  }

  public int goo() {
    System.out.println("in C1 goo");
    return 66;
  }

  public static int bar() {
    System.out.println("in C1 bar");
    return 1;
  }

  public abstract C1 newoo(C1 c1);
}