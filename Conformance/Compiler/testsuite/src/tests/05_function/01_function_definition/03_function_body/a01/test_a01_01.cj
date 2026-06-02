/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_03_a01_01

  @Level:         1

  @Assertion:     5.1.3(1) The body of a function consists of a block. 

  @Description:   Check that function body can be defined as block.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface myInterface {
  func myIF(a: String) {
    "${a} == ${a}"
  }
}

func f0(): Unit { } 
func f1(): String { "AAA" } 
func f2(a: Int32): Int32 { return a } 
func f3(a: Int32): Int32 { 
  let b = a * 2
  func nestedFunc(c: Int32) {
    c+1
  }
  return a + b + nestedFunc(b)
} 

class myClass {

  func classF1(): Rune { r'A' } 
  func classF2(a: Float32): Float32 { return a } 
  func classF3(a: String, b!: String = "$$$"): String { 
    let c = " ^ ^ "
    func classNestedFunc(d: String, t: String) {
      "${d} ${t}"
    }
    return "${c} ${classNestedFunc(b, a)}"
  } 
}

struct myStruct <: myInterface {
  public func myIF(a: String) {
    "${a} === ${a}"
  }
  func structF1(): Int64 { 16 } 
  func structF2(a: Bool): Bool { !a } 
  func structF3(a: Rune, b!: Rune = r'$'): String { 
    let c = r'^'
    func structNestedFunc(d: Rune, t: Rune): String {
      "${d} ${t}"
    }
    return "${c} ${structNestedFunc(b, a)}"
  } 
}

main() {
  Assert.equals("AAA", f1())
  Assert.equals(2, f2(2))
  Assert.equals(31, f3(6))

  var myClassImpl = myClass()
  Assert.equals(r'A', myClassImpl.classF1())
  Assert.equals(22.66, myClassImpl.classF2(22.66))
  Assert.equals(" ^ ^  $$$ AAA", myClassImpl.classF3("AAA"))
  Assert.equals(" ^ ^  &&& AAA", myClassImpl.classF3("AAA", b: "&&&"))

  var myStructImpl = myStruct()
  Assert.equals(16, myStructImpl.structF1())
  Assert.equals(false, myStructImpl.structF2(true))
  Assert.equals("^ $ A", myStructImpl.structF3(r'A'))
  Assert.equals("^ & A", myStructImpl.structF3(r'A', b: r'&'))
  Assert.equals("%$#OOO === %$#OOO", myStructImpl.myIF("%$#OOO"))
}
