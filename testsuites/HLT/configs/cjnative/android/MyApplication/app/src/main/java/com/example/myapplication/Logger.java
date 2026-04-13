/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package com.example.myapplication;

class MyArrayList {
  private String[] elements;
  private int size;
  private static final int DEFAULT_CAPACITY = 10;

  public MyArrayList() {
    elements = new String[DEFAULT_CAPACITY];
  }

  public MyArrayList(int initialCapacity) {
    if (initialCapacity <= 0)
      throw new IllegalArgumentException("Illegal Capacity: " + initialCapacity);
    elements = new String[initialCapacity];
  }

  public int size() {
    return size;
  }

  public boolean isEmpty() {
    return size == 0;
  }

  public void add(String element) {
    ensureCapacity(size + 1);
    elements[size++] = element;
  }

  public String get(int index) {
    rangeCheck(index);
    return elements[index];
  }

  public String set(int index, String element) {
    rangeCheck(index);
    String old = elements[index];
    elements[index] = element;
    return old;
  }

  public String remove(int index) {
    rangeCheck(index);
    String old = elements[index];
    int numMoved = size - index - 1;
    if (numMoved > 0) System.arraycopy(elements, index + 1, elements, index, numMoved);
    elements[--size] = null;
    return old;
  }

  private void ensureCapacity(int minCapacity) {
    if (minCapacity > elements.length) {
      int newCapacity = elements.length * 2;
      if (newCapacity < minCapacity) newCapacity = minCapacity;
      String[] newArr = new String[newCapacity];
      System.arraycopy(elements, 0, newArr, 0, size);
      elements = newArr;
    }
  }

  private void rangeCheck(int index) {
    if (index < 0 || index >= size)
      throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + size);
  }

  public String getContent() {
    StringBuilder sb = new StringBuilder();
    for (int i = 0; i < size; i++) {
      sb.append(elements[i]);
    }
    return sb.toString();
  }
}

public class Logger {
  private static final MyArrayList logs = new MyArrayList();

  public static void log(String tag, String msg) {
    System.out.print(tag + ":" + msg);
    synchronized (logs) {
      logs.add(msg);
    }
  }

  public static void println(String message) {
    Logger.print(message + "\n");
  }

  public static void println(boolean value) {
    println("" + value);
  }

  public static void println(byte value) {
    println("" + value);
  }

  public static void println(short value) {
    println("" + value);
  }

  public static void println(char value) {
    println("" + value);
  }

  public static void println(int value) {
    println("" + value);
  }

  public static void println(long value) {
    println("" + value);
  }

  public static void println(float value) {
    println("" + value);
  }

  public static void println(double value) {
    println("" + value);
  }

  public static void print(String message) {
    log("CangjieTest", message);
  }

  public static String getLog() {
    synchronized (logs) {
      return logs.getContent();
    }
  }
}
