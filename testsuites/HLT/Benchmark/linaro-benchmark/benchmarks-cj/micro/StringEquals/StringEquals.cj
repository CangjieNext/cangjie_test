/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 %overflow_wrapping %f -o %output
// RUN-EXEC: %export cjHeapSize=16GB && %export JETVMPROP="-Xmx2G" && %run %run_opt %output %run_args

import std.process.*
import std.time.*
import std.convert.*
import std.convert.*
import std.random.*
import std.collection.*

class StringEquals {
  private static let rnd :Random= Random()
  private static let NUM_Equals :Int32 = 256
  private static let STR_Length :Int32 = 128
  private var randomStrings : Array<String> = Array<String>()
  public var equalsResults : Array<Bool> = Array<Bool>()

private func generateRandomStrings() :Unit{
    for (i in 0..Int64(NUM_Equals)) {
      var sb :StringBuilder= StringBuilder()
      for (j in 0..STR_Length) {
        sb.append(Rune(rnd.nextUInt32(UInt32(25)) + UInt32(65)))
      }
      randomStrings[i] = sb.toString()
    }
  }

  public func setupStrings() :Unit{
    randomStrings = Array<String>(Int64(NUM_Equals),repeat:"")
    equalsResults = Array<Bool>(Int64(NUM_Equals - 1),repeat:false)
    generateRandomStrings()
  }

 public func timeEquals(iterations :Int32) :Unit{
     for (i in 0..iterations) {
       for (j in 0..Int64(NUM_Equals - 1)) {
         equalsResults[j] = randomStrings[j] == randomStrings[j + 1]
       }
     }
  }

}

  @OverflowWrapping
  main() :Unit{
    var reps: Int32 = 10
    var args = Process.current.arguments
         if (args.size == 1) {
             var num = Int32.tryParse(args[0])??0
             if (num != 0) {
                 reps = num
             }
         }
     let eq :StringEquals = StringEquals()
     eq.setupStrings()
     var startTime = DateTime.now()
     eq.timeEquals(1500)
     eq.timeEquals(1500)
     var endTime = DateTime.now()
     var durTime = endTime - startTime
     var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

     print(perTime.format(".2") + "ns\n")
  }

