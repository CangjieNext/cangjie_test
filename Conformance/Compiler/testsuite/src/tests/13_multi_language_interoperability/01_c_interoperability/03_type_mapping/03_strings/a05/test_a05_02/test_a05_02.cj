/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:     13_01_03_03_a05_02

  @Level:         1

  @Assertion:    13.1.3.3(5) However, when the element type of Array can conform to CType constraint,
   Cangjie allows to acquire and release the internal pointer by following functions:
  unsafe func acquireArrayRawData <T>(arr :Array <T>):CPointerHandle <T>where T <: CType
  unsafe func releaseArrayRawData <T>(h:CPointerHandle <T>):Unit where T <: CType
  struct CPointerHandle <T>{
      let pointer :CPointer <T>
      let array :Array <T>
  }
  Referring to the following example, assume we are going to write an Array<UInt8> to a file:
  foreign func fwrite (buf :CPointer <UInt8 >,size :UIntNative ,count :UIntNative ,stream :
  CPointer <Unit >):UIntNative 

  func writeFile (buffer :Array <UInt8 >,file :CPointer <Unit >){
      unsafe {
          let h=acquireArrayRawData(buffer)
          fwrite(h.pointer, 1,buffer.size, file)
      releaseArrayRawData(h)
      }
  }

  @Description:  Check passing array handlers to foreign function.

  @Mode:         run

  @Negative:     no

  @Structure:    single


*/

import utils.assert.Assert

foreign func func_01(buf: CPointer<UInt8>, size:Int64): Int64
foreign func func_02(a1: CPointer<Int64>, a2: CPointer<Float64>, size:Int64):Float64

func check01(a: Array<UInt8>) {
    var R2: Int64 = 0
    for (i in a) {
        R2 += Int64(i)
    }

    var R1: Int64
    unsafe {
        let h = acquireArrayRawData(a)
        R1 = func_01(h.pointer, a.size)
        releaseArrayRawData(h)
    }
    Assert.equals(R2, R1)
}

func check02(a: Array<Int64>, b: Array<Float64>) {
    var R2: Float64 = .0
    var I: Int64 = 0
    while (I < a.size) {
        R2 += Float64(a[I]) * b[I]
        I++
    }

    var R1: Float64
    unsafe {
        let h1 = acquireArrayRawData(a)
        let h2 = acquireArrayRawData(b)
        R1 = func_02(h1.pointer, h2.pointer, a.size)
        releaseArrayRawData(h1)
        releaseArrayRawData(h2)
    }
    Assert.equals(R2, R1)
}

main() {
    check01([])
    check01([0])
    check01([123])
    check01(Array<UInt8>(15) { i => UInt8(i * i) })

    check02([],[])
    check02([10],[.1])
    check02([8347691], [4565.2647452455])
    check02(Array<Int64>(155) { i => i * i }, Array<Float64>(155) { i => 1.0 / Float64(i) })
}