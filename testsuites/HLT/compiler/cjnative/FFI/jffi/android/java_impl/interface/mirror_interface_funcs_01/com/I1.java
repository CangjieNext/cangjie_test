package com;

import com.example.myapplication.Logger;

public interface I1 {
  public I1 foo();

  public int goo(I1 a);

  public static int bar() {
    Logger.println("in I1 bar");
    return 1;
  }
}