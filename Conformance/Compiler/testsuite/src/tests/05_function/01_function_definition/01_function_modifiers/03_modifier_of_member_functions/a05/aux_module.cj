/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description: Aux file with module 'mod_05_01_01_03_a05'

  @Module:      mod_05_01_01_03_a05

  @Structure:   complex-aux

*/

package pkg

public interface myInterface {
  static func myInterfaceStaticFunc(): String {"myInterfaceStaticFunc return"}
  func myInterfaceFunc(a: Int32, b!: Int32): Int32
}

public class myClass {
  private let myPrivateLet: Int32 = 762
  protected var myProtectedLet: Int32 = 267

  static func myStaticFunc() {
    "this is myClass static func"
  }

  func myPackagePrivateFunc() {
    return """
      private: ${this.myPrivateFunc()}
      protected: ${this.myProtectedFunc()}"""
  }

  private func myPrivateFunc() {
    this.myPrivateLet
  }

  protected func myProtectedFunc() {
    this.myProtectedLet
  }
}

public struct myStruct {

  func myStructFunc() {
    "this is a myStructFunc func return value"
  }

  static func myStructStaticFunc() {
    "this is a myStructStaticFunc func return value"
  }
}

public enum Color {
  RED | BLUE | GREEN

  static func myEnumStaticFunc() {
    "myEnumStaticFunc"
  } 

  private func getColorAsString(inVal: Color) {
    match (inVal) {
      case RED => "#FF0000"
      case BLUE => "#0000FF"
      case GREEN => "#00FF00"
    }
  }

  func getColor() {
    return getColorAsString(this)
  }
}