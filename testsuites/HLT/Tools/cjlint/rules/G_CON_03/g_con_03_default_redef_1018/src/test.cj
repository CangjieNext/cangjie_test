import std.sync.ReentrantMutex

var arr: Array<Int64> = [1,2]

open class Base {
  private static let baseMtx: ReentrantMutex = ReentrantMutex()
  public static func doSomething() {
    synchronized(baseMtx) {

    }
  }

  public static func doSomething1() {
    synchronized(baseMtx) {

    }
  }

  public static func doSomething2() {
    synchronized(baseMtx) {

    }
  }

  open func doSomething3() {
    synchronized(baseMtx) {

    }
  }

  public static func doSomething4() {
    synchronized(baseMtx) {

    }
  }

  open func doSomething5() {
    synchronized(baseMtx) {

    }
  }
}
class Derived <: Base {
  private static let baseMtx: ReentrantMutex = ReentrantMutex()
  public redef static func doSomething() {
    synchronized(baseMtx) {

    }
  }

  public redef static func doSomething1() {
    synchronized(baseMtx) {

    }
  }

  public redef static func doSomething2() {
    synchronized(baseMtx) {

    }
  }

  override func doSomething3() {
    synchronized(baseMtx) {

    }
    arr = [1,2]
  }

  public redef static func doSomething4() {
    synchronized(baseMtx) {

    }
    arr = [1,2]
  }

  override func doSomething5() {
    synchronized(baseMtx) {

    }
    arr = [1,2]
    synchronized(baseMtx) {

    }
  }

}

main(){0}

/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
