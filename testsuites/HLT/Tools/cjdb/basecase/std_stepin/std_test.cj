/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.ast.*
import stdx.encoding.url.*

import stdx.net.http.*
import std.regex.*
import stdx.serialization.serialization.*
import std.sync.*
import stdx.compress.zlib.*
import stdx.encoding.base64.*
import std.convert.*
import std.sort.*
import std.posix.*

import std.convert.*
import stdx.encoding.hex.*
import stdx.encoding.json.*
import std.fs.*
import std.io.*
import stdx.log.*
import std.math.*
import std.net.*
import stdx.net.tls.*
import std.unittest.*
import std.unittest.testmacro.*
import std.time.*
import std.unicode.*
import std.argopt.*
import std.collection.*
import std.process.*
import std.random.*
import std.overflow.*

foreign func printf(fmt: CString, ...) : Int32

func viewHandler(ctx:HttpContext): Unit {
     println("This viewHandler is Invoking!! view111111 !!!")
}

var port = AtomicUInt16(0)
func clientSocket(): Unit {
     var server = TcpSocket(IPSocketAddress("0.0.0.0", port.load()))
     var buf: Array<UInt8> = Array<UInt8>(1024*106, repeat: 8)
     server.connect()
     server.write(buf)
     server.close()
}

func test(t1:Int64, t2:Int64):Ordering{
    if(t1>t2){
        return Ordering.GT
    }
    else if(t1<t2){
        return Ordering.LT
    }
    return Ordering.EQ
}

var n: Int32 = 0
var count: Int32 = 0

@Test
public class TestA {
    @TestCase
    public func case1():Unit {
        if (n == 1) {
            n++
        }
    }

    @TestCase
    public func case2():Unit {
        if (n == 2) {
            n++
        }
    }

    @TestCase
    public func case3():Unit {
        if (n == 3) {
            n++
        }
    }

    public override func afterAll(): Unit {
        n++
    }

    public override func beforeAll(): Unit {
        n++
    }
}


class A <: Logger{
    public var count:Int64=0
    public mut prop level: LogLevel {
         get() {
              LogLevel.ALL
         }
         set(level) {
              count = count + 1
         }
    }
    public func setOutput(outputstream:OutputStream): Unit {
         count=count+1
    }
    public func trace(msg:String): Unit {
         count=count+1
    }
    public func debug(msg:String): Unit {
         count=count+1
    }
    public func info(msg:String): Unit {
         count=count+1
    }
    public func warn(msg:String): Unit{
         count=count+1
    }
    public func error(msg:String): Unit{
         count=count+1
    }
    public func log(level:LogLevel,msg:String): Unit{
         count=count+1
    }; public func close(): Unit {}; public func isClosed(): Bool { true }; public func log(record:LogRecord): Unit {}; public func withAttrs(attrs:Array<Attr>): Logger { this }
}


main():Int64 {

     //core
     var core_1: Array<Int64> = [1, 2, 3, 4, 5]
     var core_2 = "hello"

     //ast
     let input1 = quote(1 + 2)
     let input2 = quote(class A{})
     let expr1 = parseExpr(input1)
     let decl1 = parseDecl(input2)
     expr1.toTokens().dump() // Ok
     quote($expr1).dump() // Ok
     decl1.toTokens().dump() // Ok
     quote($decl1).dump() // Ok

     //collection
     var collection_1: ArrayList<Int64> = ArrayList<Int64>(10)
     collection_1.add(97)
     collection_1.add(100)
     collection_1.add(101)
     collection_1.remove(at: 2)
     collection_1[1] = 120
     var collection_2 = collection_1.get(1)
     print("collection_2 = ${collection_2.getOrThrow()}")

     //sort
     var sort_1:Array<Int64>=Array<Int64>()
     stableSort(sort_1[0..0])
     var sort_2:Array<Int64>=[8,6,78,21,45,23,75,78,43]
     unstableSort(sort_2[0..3],test)

     //overflow
     let overflow_1:UInt16 = UInt16.Max / 8 + 1
     println(overflow_1.saturatingMul(16))


     //convert
     var str_2 = "'1"
     var a = Rune.tryParse("a'")
     var b = Rune.tryParse(str_2)
     var c = Rune.tryParse("'b\\'")

     var str_3 = "126"
     var a_3 = Int8.tryParse("50")
     var b_3 = Int16.tryParse(str_3)
     var c_3 = Int32.tryParse("32")
     var d = Int64.tryParse("64")
     var e = UInt8.tryParse("254")
     var f = UInt16.tryParse("16")
     var g = UInt32.tryParse("43")
     var h = UInt64.tryParse("64")
     var i = Float16.tryParse("3.1244_6_4_6")
     var j = Float32.tryParse(".3545464")
     var k = Float64.tryParse("124.2214")


     //ffi
     var ffi_1 = unsafe { LibC.mallocCString("%d %d %d %d %d %d\n") }
     unsafe { printf(ffi_1, 1, 2, 3, 4, 5, 6) }
     unsafe { LibC.free(ffi_1) }


     //format
     var a_5: Rune = r'a'
     var b_5: Float32 = .34
     var c_5: UInt32 = 20
     var d_5: Int64 = -20

     var res1 = a_5.format("-10")  // left  align
     var res2 = b_5.format("+20")  // right align
     var res3 = c_5.format("10")  // right align
     var res4 = c_5.format("") 
     var res5 = d_5.format("")

     var i1: Int8 = -0b10000000
     var flags =  '-'
     var width =  20
     var precision = 8
     var special = 'x'
     var res6 = i1.format("${flags}${width}.${precision}X")

     //json
     var str = ##"[true,"kjjjke\"eed",{"sdfd":"ggggg","eeeee":[341,false,
               {"nnnn":55.87}]},3422,22.341,false,[22,22.22,true,"ddd"],43]"##
     var jv: JsonValue = JsonValue.fromStr(str)
     var res = jv.toString()
     var prettyres = jv.toJsonString()
     var strO = ##"{"name":"Tom","age":"18","version":"0.1.1"}"##
     var kO = JsonValue.fromStr(strO)
     var resO = kO.asObject().get("name").getOrThrow().toString()

     var a_json: JsonValue = JsonNull()
     var b_json: JsonValue = JsonBool(true)
     var c_json: JsonValue = JsonBool(false)
     var d_json: JsonValue = JsonInt(7363)
     var e_json: JsonValue = JsonFloat(736423.546)
     var list_json: ArrayList<JsonValue> = ArrayList<JsonValue>()
     var list2_json: ArrayList<JsonValue> = ArrayList<JsonValue>()
     var map_json = JsonObject()
     var map1_json = JsonObject()
     map1_json.put("a_json", JsonString("jjjjjj"))
     map1_json.put("b_json", b_json)
     map1_json.put("c_json", JsonString("hhhhh"))
     list2_json.add(b_json)
     list2_json.add(JsonInt(3333333))
     list2_json.add(map1_json)
     list2_json.add(JsonString("sdfghgfasd"))
     list_json.add(b_json)
     list_json.add(a_json)
     list_json.add(map_json)
     list_json.add(c_json)
     list_json.add(JsonArray(list2_json))
     list_json.add(d_json)
     list_json.add(JsonString("ddddddd"))
     list_json.add(e_json)
     var result: JsonValue = JsonArray(list_json)

     //base64
     var arr_base64: Array<UInt8> = [77, 97, 110]
     var str_base64 = toBase64String(arr_base64)
     var str_1 = "TWFu"
     var base64string_1 = fromBase64String("TWFu")
     var base64string_2 = fromBase64String(str_1)

     //hex
     var str_6 = "63616e676a6965"
     var opt_6_1 = fromHexString("63616e676a6965")
     var opt_6_2 = fromHexString(str_6)
     var res_6_1 = toHexString([1u8, 10u8, 20u8])

     //url
     var url_1 = Form("2=3&1=%6AD&1=2")
     // 对于 %6A 解码成 j，重复的 key 调用 get 获取第一个 value 值 jD
     print(url_1.get("1").getOrThrow())
     var url_2 = Form()
     url_2.add("k", "v1")
     url_2.add("k", "v2")
     println(url_2.get("k").getOrThrow())
     url_2.set("k", "v")
     println(url_2.get("k").getOrThrow())
     let clone_f = url_2.clone()
     clone_f.add("k1", "v1")
     println(clone_f.get("k1").getOrThrow())
     println(url_2.get("k1")??"kkk")

     //xml -- XmlParser was deprecated
     // let x: XmlParser = XmlParser()
     // var ret = x.parse("<myxml>Some data </myxml>")
     // match (ret) {
     //     case Some(root) => println(root.name)
     //     case None => println("XML Parse error.")
     // }

     //log
     var myclass:A=A()
     myclass.level = LogLevel.ERROR
     var levels=myclass.level.toString()
     if(levels!="ALL")
     {
          return 1
     }
     var fs = File("black1.txt", OpenMode.Append)
     myclass.setOutput(fs)
     myclass.trace("str")
     myclass.debug("str")
     myclass.info("str")
     myclass.warn("str")
     myclass.error("str")
     myclass.log(LogLevel.ERROR,"str")
     fs.flush()
     fs.close()

     //math
     var math_1 = abs(-1)
     var math_2 = cbrt(0.23)
     var math_3 = ceil(90.1)
     var math_4 = clamp(0.87,0.1,0.2)
     var math_5 = countOne(10)
     var math_6 = erf(9.347)
     var math_7 = exp(9.1)
     var math_8 = exp2(10.1)
     var math_9 = floor(-10.2)
     var math_10 = gamma(10.3)
     var math_11 = gcd(10,9)
     var math_12 = (9.99999999).isInf()
     var math_13 = (-0.4879).isNaN()
     var math_14 = (0.9).isNormal()
     var math_15 = lcm(3,10)
     var math_16 = leadingZeros(19)
     var math_17 = log(8.8)
     var math_18 = log2(99.1)
     var math_19 = log10(100.1)
     var math_20 = logBase(2.2,4.1)
     var math_21 = max(1,-1)
     var math_22 = Float64.max(1.2,4.2)
     var math_23 = min(1,9)
     var math_24 = Float64.min(-9.2,9.9)
     var reverse_1:UInt64 = 99
     var math_25 = reverse(reverse_1)
     var math_26 = rotate(13,2)
     var math_27 = sqrt(19.1)
     var math_28 = trailingZeros(180)
     var math_29 = trunc(0.99)
     var math_30 = sin(cos(tan(0.5)))
     var math_31 = acos(asin(atan(0.6)))
     var math_32 = cosh(sinh(tanh(0.4)))
     var math_33 = atanh(-0.5)
     var math_34 = asinh(-0.5)
     var math_35 = acosh(1.1)
     var math_36 = round(10.1)

     //tls

     //http
     let serv = ServerBuilder().addr("127.0.0.1").port(0).build()
     serv.distributor.register("/view/01", FuncHandler(viewHandler))
     
     //os
    // var os_1: Bool = isType("/notdirs", S_IFDIR)
     var os_2: Bool = isDir("/dev")
     var os_3 = access("./oscfg.cfg", F_OK)
     
    // var os_5 = nice(200)
     let arr: ArrayList<String> = ArrayList<String>(["o","pid,ppid,pgrp,session,tpgid,comm"])
     let ps_argv: Array<String> = arr.toArray()

     //regex
     let regex_1 = Regex("ab")
     let regex_2 = Regex("ab", RegexOption().ignoreCase())
     let regex_3 = Regex("\\d+")
     let regex_4 = regex_3.matcher("13588123456")
     let regex_5 = regex_4.fullMatch()
     regex_4.resetString("13588abc")
     let regex_6 = regex_4.matchStart()
     regex_4.resetString("abc13588123abc")
     let regex_7 = regex_4.matchStart()

     //serialization

     //sync
     let count_sync = AtomicInt64(0)
     let list_sync = ArrayList<Future<Int64>>()
     /* 创建 1000 个线程 */
     for (_ in 0..1000) {
          let fut = spawn {
              sleep(Duration.millisecond) /* 睡眠 1 毫秒 */
              count_sync.fetchAdd(1)
          }
          list_sync.add(fut)
     }
     /* 等待所有线程完成 */
     for (f_ss in list_sync) {
          f_ss.get()
     }
     var val = count_sync.load()
     println("count = ${val}")
     
     //time
     var now = DateTime.now()
     var yr = now.year
     var mon = now.month
     var day = now.dayOfMonth
     var hr = now.hour
     var min = now.minute
     var sec = now.second
     var ns = now.nanosecond
     var (name, offset) = (now.zoneId, now.zoneOffset)
     var wday = now.dayOfWeek
     var yday = now.dayOfYear
     var (isoYr, isoWk) = now.isoWeek
     var t = DateTime.of(year: 2021, month: Month.August, dayOfMonth: 5)
     var customPtn = "yyyy/MM/dd HH:mm:ss OOOO"
     var t1 = DateTime.parse("2021-08-05T21:08:04+08:00")
     var t2 = DateTime.parse("2021/08/05 21:08:04 +10:00", customPtn)
     var sat = DayOfWeek.Saturday
     var sun = DayOfWeek.of(0)
     var jan = Month.January
     var feb = Month.of(2)
     var d1 = Duration.nanosecond * 10000
     var d2 = Duration.microsecond * 100
     var d3 = Duration.millisecond * 10
     var d4 = Duration.second
     var d5 = Duration.minute * 2
     var d6 = Duration.hour * 3
     var utc = TimeZone.load("UTC")
     var local = TimeZone.load("Local")
     var newYork = TimeZone.load("America/New_York")
     var custom = TimeZone("Custom", Duration.second * 3600)
     var timer = Timer.once(Duration.second) { => println("Hi") }
     var ticker = Timer.repeat(Duration.millisecond * 200, Duration.millisecond * 200, { =>
          println("Hi")
     })


     //unicode
     var unicode_1 = r'a'.isLetter()
     var unicode_2 = r'A'.isLowerCase()
     var unicode_3 = r'1'.isNumber()
     var unicode_4 = r'a'.isTitleCase()
     var unicode_5 = r'a'.isUpperCase()
     var unicode_6 = r'a'.isWhiteSpace()
     var unicode_7 = r'A'.toLowerCase()
     var unicode_8 = r'1'.toTitleCase()
     var unicode_9 = r'a'.toUpperCase()
     let unicode_string = ["",#""#,"""
"""]
     unicode_string[0].isBlank()
     unicode_string[1].toLower()
     unicode_string[2].toTitle()
     unicode_string[0].toUpper()
     unicode_string[1].trim()
     unicode_string[2].trimLeft()
     unicode_string[0].trimRight()

     //unittest
     let a_test = TestA()
     var a_suite = a_test.asTestSuite()
     
     a_suite = a_test.asTestSuite()
     let report = a_suite.runTests()
     a_suite = a_test.asTestSuite()

     report.reportTo(ConsoleReporter())
     report.reportTo(ConsoleReporter())


     //argopt
     var args: Array<String> =["-a1", "-b2", "-cfoo", "--arg1", "bar", "--arg2", "a1", "a2"]
     var longFormat: Array<String> =["arg1=", "arg2="]
     var shortFormat = "a:b:c:"
     var parser = ArgOpt(args, shortFormat, longFormat)
     var opt1 = parser.getArg("--arg1")
     var opt2 = parser.getArg("--arg2")
     var opt3 = parser.getArg("a")
     var opt4 = parser.getArg("b")
     var opt5 = parser.getArg("c")
     var opt6 = parser.getArg("abc")

     var res7 = ""
     var argsMap = parser.getArgumentsMap()
     var unArgs = parser.getUnparseArgs()
     
     let args_2 =["--url=\'abcdefg/?@!RW!&&@#$%^*()_+=-[]=;{}?.,<>/;:\"\'"]
     let parsedArgs = ArgOpt(args,"ds:fd:fd:",["url="])
     var allmap = parsedArgs.getArgumentsMap()
     var keys = allmap.keys()
     var expect_keys = HashSet<String>(["--url"])

     var values = allmap.values()
     var act_values = HashSet<String>(values)
     var expect_values = HashSet<String>(["\'abcdefg/?@!RW!&&@#$%^*()_+=-[]=;{}?.,<>/;:\"\'"])

     //random
     var random_1 = Random(UInt64(15))
     var random_2 = random_1.nextInt8()
     var random_3 = Random()

     var r = Random()
     var m1 = (r.nextBool() is Bool)
     var m2 = (r.nextUInt8() is UInt8)
     var m3 = (r.nextUInt16()is UInt16)
     var m4 = (r.nextUInt32() is UInt32)
     var m5 = (r.nextUInt64() is UInt64)
     var m6 = (r.nextInt8() is Int8)
     var m7 = (r.nextInt16() is Int16)
     var m8 = (r.nextInt32() is Int32)
     var m9 = (r.nextInt64() is Int64)
     var m10 = (r.nextFloat16() is Float16)
     var m11 = (r.nextFloat32() is Float32)
     var m12 = (r.nextFloat64() is Float64)
     var m13 = (r.nextGaussianFloat16() is Float16)
     var m14 = (r.nextGaussianFloat32() is Float32)
     var m15 = (r.nextGaussianFloat64() is Float64)

     //socket
     var server = TcpServerSocket(bindAt:0)
     server.bind()
     port.store((server.localAddress as IPSocketAddress)?.port ?? 0)
     spawn {
          clientSocket()
     }
     var client = server.accept()
     var buf = Array<UInt8>(1024*105, repeat: 0)
     server.close()

     //zlib
     var source = File("./zlib_test.md", ReadWrite)
     var tempBuf: Array<UInt8> = Array<UInt8>(1024, repeat: 0)
     var dest1: ByteBuffer = ByteBuffer()
     var compressOutputStream: CompressOutputStream = CompressOutputStream(dest1, wrap:GzipFormat, bufLen: 10000)

     return 0
}
