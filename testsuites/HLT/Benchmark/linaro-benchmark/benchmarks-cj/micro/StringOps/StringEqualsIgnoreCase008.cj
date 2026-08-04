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

class StringOps {
  private static let NUM_LENGTH_TESTS :Int32 = 6
    private static let RANDOM_STRING_8 :Int32 = 0
    private static let RANDOM_STRING_16 :Int32 = 1
    private static let RANDOM_STRING_32 :Int32 = 2
    private static let RANDOM_STRING_128 :Int32 = 3
    private static let RANDOM_STRING_512 :Int32 = 4
    private static let RANDOM_STRING_2048 :Int32 = 5
    private static  let SAME_SEED :Int32 = 0
    private static  var MIN_RANDOM_CHAR :Rune = Rune(UInt32(65))
    private static  var MAX_RANDOM_CHAR :Rune = Rune(UInt32(123))
    private static let rnd :Random = Random(UInt64(SAME_SEED))
    private static let rndAlt :Random = Random(UInt64(SAME_SEED))

    private static var stringEqualsIgnoreCaseResults :Array<Bool> = Array<Bool>(Int64(NUM_LENGTH_TESTS),repeat:false)
    private static var stringData :Array<String> = Array<String>(Int64(NUM_LENGTH_TESTS),repeat:"")
    private static var stringDataAlt :Array<String> = Array<String>(Int64(NUM_LENGTH_TESTS),repeat:"")

    public static func generateRandomStringFromRange(len :Int32,rnd :Random,minValue :Rune, maxValue :Rune) :String{
      if (maxValue < minValue) {
        throw IllegalArgumentException("Cannot generate random string"+ " - maxValue is smaller than minValue")
      }
      var sb :StringBuilder= StringBuilder()
      for (i in 0..len - 1) {
        sb.append(Rune(UInt32(minValue) + rnd.nextUInt32(UInt32(maxValue) - UInt32(minValue))))
      }
      sb.append(maxValue)
      return sb.toString()
    }

   public static func generateRandomString(len :Int32,rnd : Random) :String{
      return generateRandomStringFromRange(len, rnd, MIN_RANDOM_CHAR, MAX_RANDOM_CHAR)
    }

   public static func generateRandomStrings(rnd :Random,output :Array<String>) :Unit{
      output[Int64(RANDOM_STRING_8)] = generateRandomString(8, rnd)
      output[Int64(RANDOM_STRING_16)] = generateRandomString(16, rnd)
      output[Int64(RANDOM_STRING_32)] = generateRandomString(32, rnd)
      output[Int64(RANDOM_STRING_128)] = generateRandomString(128, rnd)
      output[Int64(RANDOM_STRING_512)] = generateRandomString(512, rnd)
      output[Int64(RANDOM_STRING_2048)] = generateRandomString(2048, rnd)
    }

  public func generateRandomStr() :Unit{
       generateRandomStrings(rnd, stringData)
       generateRandomStrings(rndAlt, stringDataAlt)
  }

func equalsIgnoreCase(str_compare_1 :String , str_compare_2 :String) :Int32{
    var str_1 :String
    var str_2 :String
    var compareToResInt :Int32 = -1
        for(i in 0..str_compare_1.size){
        str_1 = str_compare_1[i].toString().toAsciiLower()
        str_2 = str_compare_2[i].toString().toAsciiLower()
        compareToResInt = match(str_1 == str_2) {
               case true => 1
               case false => 0
               case _ => -1
             }
         }
    return compareToResInt
}

func timeStringEqualsIgnoreCase008(iterations :Int32) :Unit{
    
    var compareFlag_1 : Int32
    var compareFlag_2 : Int32
    var exec_result : Bool
    for (i in 0..iterations) {
       compareFlag_1 = match( stringEqualsIgnoreCaseResults[Int64(RANDOM_STRING_8)]){
           case true => 1
           case false => 0
           case _ => -1
       }
       compareFlag_2 = this.equalsIgnoreCase(stringData[Int64(RANDOM_STRING_8)],stringDataAlt[Int64(RANDOM_STRING_8)])
       if((compareFlag_1 ^ compareFlag_2) ==1){
           exec_result = true
           stringEqualsIgnoreCaseResults[Int64(RANDOM_STRING_8)] = exec_result
       }else{
           exec_result = false
           stringEqualsIgnoreCaseResults[Int64(RANDOM_STRING_8)] = exec_result
       }
     }
   }

}

  let ITER_COUNT :Int32 = 22000
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
     let obj :StringOps = StringOps()
     obj.generateRandomStr()
     var startTime = DateTime.now()
     obj.timeStringEqualsIgnoreCase008(ITER_COUNT)
     var endTime = DateTime.now()
     var durTime = endTime - startTime
     var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

     print(perTime.format(".2") + "ns\n")
 }

