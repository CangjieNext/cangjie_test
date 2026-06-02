/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_03_a05_01

  @Level:         1

  @Assertion:    13.1.3.3(5) However, when the element type of Arraycan conform to CType constraint,
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

  @Description:  Checks that positive example compiles.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single
  @Issue:        0006635

*/

foreign func fwrite(buf: CPointer<UInt8>, size: UIntNative, count: UIntNative, stream: CPointer<Unit>): UIntNative 

func writeFile(buffer: Array<UInt8>, file: CPointer<Unit>) {
    unsafe {
        let h = acquireArrayRawData(buffer)
        fwrite(h.pointer, 1, UIntNative(buffer.size), file)
        releaseArrayRawData(h)
    }
}

main() {
    writeFile([1, 2, 3, 3, 2, 1], CPointer<Unit>())
}
