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
    private static  var MIN_RANDOM_CHAR_NON_ASCII :Rune = Rune(UInt32(0x3000))
    private static  var MAX_RANDOM_CHAR_NON_ASCII :Rune = Rune(UInt32(0xcfff))
    private static let rnd :Random = Random(UInt64(SAME_SEED))
    private static let rndNonAscii :Random = Random(UInt64(SAME_SEED))

    private static var stringGetCharsNoCheckNonAsciiResults :Array<Array<Rune>> = Array<Array<Rune>>(Int64(NUM_LENGTH_TESTS), repeat: Array<Rune>(Int64(NUM_LENGTH_TESTS), repeat: r' '))
    private static var stringDataNonAscii :Array<String> = Array<String>(Int64(NUM_LENGTH_TESTS),repeat:"")

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

   public static func generateRandomStringNonAscii(len :Int32,rnd : Random) :String{
      return generateRandomStringFromRange(len, rnd, MIN_RANDOM_CHAR_NON_ASCII, MAX_RANDOM_CHAR_NON_ASCII)
    }

   public static func generateRandomStringsNonAscii(rnd :Random,output :Array<String>) :Unit{
      output[Int64(RANDOM_STRING_8)] = generateRandomStringNonAscii(8, rnd)
      output[Int64(RANDOM_STRING_16)] = generateRandomStringNonAscii(16, rnd)
      output[Int64(RANDOM_STRING_32)] = generateRandomStringNonAscii(32, rnd)
      output[Int64(RANDOM_STRING_128)] = generateRandomStringNonAscii(128, rnd)
      output[Int64(RANDOM_STRING_512)] = generateRandomStringNonAscii(512, rnd)
      output[Int64(RANDOM_STRING_2048)] = generateRandomStringNonAscii(2048, rnd)
    }

  public static func  allocateResultCharArrays(resultArrays :Array<Array<Rune>>) :Unit{
    resultArrays[Int64(RANDOM_STRING_8)] = Array<Rune>(8, repeat:r' ')
    resultArrays[Int64(RANDOM_STRING_16)] = Array<Rune>(16, repeat:r' ')
    resultArrays[Int64(RANDOM_STRING_32)] = Array<Rune>(32, repeat:r' ')
    resultArrays[Int64(RANDOM_STRING_128)] = Array<Rune>(128, repeat:r' ')
    resultArrays[Int64(RANDOM_STRING_512)] = Array<Rune>(512, repeat:r' ')
    resultArrays[Int64(RANDOM_STRING_2048)] = Array<Rune>(2048, repeat:r' ')
  }

  public func generateRandomStr() :Unit{
       generateRandomStringsNonAscii(rndNonAscii, stringDataNonAscii)
       allocateResultCharArrays(stringGetCharsNoCheckNonAsciiResults)
  }

func getChars(str_src : String , srcBegin :Int32, srcEnd :Int32, dst :Array<Rune>, dstBegin :Int32) :Array<Rune>{
    var src_Carr :Array<Rune> = str_src.toRuneArray()
    var dst_Carr :Array<Rune> = []
    var range_end :Int64 = str_src.size
    var temp :Int64
    try{
        if(range_end <= Int64(srcEnd)){
            temp = range_end
        }else{
            temp = Int64(srcEnd)
        }
        var src_Carr_sub :Array<Rune> = src_Carr.slice(Int64(srcBegin), temp)
        dst_Carr = dst.slice(Int64(0), Int64(dstBegin))
        if(dst_Carr.isEmpty() == true){
            for(i in 0..src_Carr_sub.size){
                dst_Carr[i] = src_Carr_sub[i]
            }
         }
       }catch(e:Exception){
          
       }
    return dst_Carr
}


func timeStringGetCharsNoCheckNonAscii0016(iterations :Int32) :Unit{
   
   var chars :Array<Rune> = stringGetCharsNoCheckNonAsciiResults[Int64(RANDOM_STRING_16)]
   var str :String = stringDataNonAscii[Int64(RANDOM_STRING_16)]
    for (i in 0..iterations) {
         this.getChars(str, 0, 16, chars, 0)
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
     obj.timeStringGetCharsNoCheckNonAscii0016(ITER_COUNT)
     var endTime = DateTime.now()
     var durTime = endTime - startTime
     var perTime: Float64 = Float64(durTime.toNanoseconds())/Float64(reps)

     print(perTime.format(".2") + "ns\n")
 }

