/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=512mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*


open class MyDate {
    

    public func timeIntervalSince1970(): Int64 {
        return 1167585071
    }
    public func timeStamp(): Int64{
        return 1167585071
    }
    public func milliStamp(): Int64 {
        return  1167585071000
    }
    init(str: String){
    }
    
    public func getDate(): Int64 {
        
        return 1
    }
    public func getTimezoneOffset(): Int64{
        
        return  -480
    }
    public  func getYear(): Int64{
        //
        return 2007
    }
    public  func getFullYear(): Int64 {
        
        return 2007
    }
    public func getMonth(): Int64{
        
        return 1
    }
    public func getHours(): Int64{
        
        return 1
    }
    public func getMinutes(): Int64{
        
        return 11
    }
    public  func getSeconds(): Int64 {
        
        return 11
    }
    public  func getDay(): Int64 {
        
        return 1
    }

    public func getTime(): Int64{
        
        let timeInterval = this.timeIntervalSince1970()
        return   timeInterval * 1000
    }
    public  func setTime(millisedcond: Int64)  {
        //Method to set the Date object in milliseconds.
    }
}
class DateFormatter{
    public var dateFormat: String = ""
    public var timeZone: TimeZone = TimeZone("") 
    init() {
    }
    public func newDate(tmp_from: String): MyDate {
        return MyDate(tmp_from)
    }
}

class TimeZone {
    var identifier: String
    public init(identifier: String) {
        this.identifier = identifier
    }
}

func arrayExists(array: Array<String>, x: String): Bool{
    for (i in 0..array.size) {
        if (array[i] == x) {
            return true
        }
    }
    return false
}

class DateClass <: MyDate {
    let switches =    ["a", "A", "B", "d", "D", "F", "g", "G", "h", "H",
                        "i", "j", "l", "L", "m", "M", "n", "O", "r", "s",
                        "S", "t", "U", "w", "W", "y", "Y", "z"];
    let daysLong =    ["Sunday", "Monday", "Tuesday", "Wednesday",
                        "Thursday", "Friday", "Saturday"];
    let daysShort =   ["Sun", "Mon", "Tue", "Wed",
                        "Thu", "Fri", "Sat"];
    let monthsShort = ["Jan", "Feb", "Mar", "Apr",
                        "May", "Jun", "Jul", "Aug", "Sep",
                        "Oct", "Nov", "Dec"];
    let monthsLong =  ["January", "February", "March", "April",
                        "May", "June", "July", "August", "September",
                        "October", "November", "December"];
    let daysSuffix = ["st", "nd", "rd", "th", "th", "th", "th",   // 1st - 7th
                        "th", "th", "th", "th", "th", "th", "th", // 8th - 14th
                        "th", "th", "th", "th", "th", "th", "st", // 15th - 21st
                        "nd", "rd", "th", "th", "th", "th", "th", // 22nd - 28th
                        "th", "th", "st"];                        // 29th - 31st
    
    init(str: Option<String>) {
        super(str.getOrThrow())
        
    }
    func formatDate(input: String, time: ?Int64): String {

        var prevTime = 0
        if (time.isSome()) {
            // save time
            prevTime = this.getTime();
            this.setTime(time.getOrThrow());
        }
        var arr = stringToArray(input)
        for (index in 0..arr.size) {
            if (arrayExists(switches, arr[index])) {
                var value: String = arr[index]
                match (arr[index]) {
                case "a" => value =  a()
                case "A" => value =  A()
                case "B" => value =  B() 
                case "d" => value =  d() 
                case "D" => value =  D() 
                case "F" => value =  F() 
                case "g" => value =  g()
                case "G" => value = "${G()}"
                case "h" => value =  h()
                case "H" => value =  H()
                case "i" => value =  i()
                case "j" => value =  "${j()}"
                case "l" => value =  l()
                case "L" => value =  "${L()}"
                case "m" => value =  m()
                case "M" => value =  M()
                case "n" => value =  "${n()}"
                case "O" => value =  O()
                case "r" => value =  r()
                case "s" => value =  s()
                case "S" => value = S()
                case "t" => value = "${t()}"
                case "U" => value = "${U()}"
                case "w" => value =  "${w()}"
                case "W" => value =  W()
                case "y" => value = y()
                case "Y" => value = "${Y()}"
                case "z" => value =  "${z()}"
                case  _  => break

                }
                arr[index] = value;
            }
        }
        //reset time, back to what it was
        if (prevTime != 0) {
            this.setTime(prevTime);
        }
        return String.join(arr.toArray(), delimiter: "")
    }
    func a(): String {
        // Lowercase Ante meridiem and Post meridiem
        if (this.getHours() > 11) {
            return "pm"
        } else {
            return "am"
        }
    }
    func A(): String {
        // Uppercase Ante meridiem and Post meridiem
        if (this.getHours() > 11) {
            return "PM"
        } else {
            return "AM"
        }
    }

    func B(): String{
        
        let off = (this.getTimezoneOffset() + 60)*60;
        let theSeconds = (this.getHours() * 3600) + (this.getMinutes() * 60) + this.getSeconds() + off;
        var beat = floor(Float64(theSeconds)/86.4);
        if (beat > Float64(1000)) {
            beat -= Float64(1000)
        };
        if (beat < Float64(0)) {
            beat += Float64(1000)
        };
        var betaStr = "$(beat)"
        if (betaStr.size == 1) {
            betaStr =  "00$(beat)"
        }
        if (betaStr.size == 2) {
            betaStr = "0$(beat)"
        }
        return betaStr
    }

    func d(): String{
        // Day of the month, 2 digits with leading zeros
        if ("$(this.getDate())".size == 1) {
            return "0$(this.getDate())"
        } else {
            return "$(this.getDate())"
        }
    }
    func D(): String{
        // A textual representation of a day, three letters
        return daysShort[this.getDay()];
    }
    func F(): String{
        // A full textual representation of a month
        return monthsLong[this.getMonth() - 1];
    }
    func g(): String{
        // 12-hour format of an hour without leading zeros
        if (this.getHours() > 12) {
            return "$(this.getHours()-12)"
        } else {
            return "$(this.getHours())"
        }
    }
    func G(): Int64{
        // 24-hour format of an hour without leading zeros
        return this.getHours();
    }
    func h(): String{
        // 12-hour format of an hour with leading zeros
        if (this.getHours() > 12) {
            let s = "$(this.getHours() - 12)"
            if (s.size == 1) {
                return "0$(this.getHours() - 12)"
            } else {
                return "$(this.getHours() - 12)"
            }
        } else {
            let s = "$(this.getHours())";
            if (s.size == 1) {
                return "0$(this.getHours())"
            } else {
                return "$(this.getHours())"
            }
        }
    }
    func H(): String{
        // 24-hour format of an hour with leading zeros
        if ("$(this.getHours())".size == 1) {
            return "0$(this.getHours())"
        } else {
            return "$(this.getHours())"
        }
    }
    func i(): String{
        // Minutes with leading zeros
        if ("$(this.getMinutes())".size == 1) {
            return "0$(this.getMinutes())"
        } else {
            return "$(this.getMinutes())"
        }
    }
    func j(): Int64{
        // Day of the month without leading zeros
        return this.getDate();
    }
    func l(): String{
        // A full textual representation of the day of the week
        return daysLong[this.getDay() - 1];
    }
    func L(): Int64{
        // leap year or not. 1 if leap year, 0 if not.
        // the logic should match iso's 8601 standard.
        let y_ = Y();
        if (
            (y_ % 4 == 0 && y_ % 100 != 0) ||
            (y_ % 4 == 0 && y_ % 100 == 0 && y_ % 400 == 0)
        ) {
            return 1;
        } else {
            return 0;
        }
    }
    func m(): String{
        // Numeric representation of a month, with leading zeros
        if (this.getMonth() < 9) {
            return "0$(this.getMonth() + 1)"
        } else {
            return "$(this.getMonth() + 1)"
        }
    }
    func M(): String{
        // A short textual representation of a month, three letters
        return monthsShort[this.getMonth()];
    }
    func n(): Int64{
        // Numeric representation of a month, without leading zeros
        return this.getMonth() + 1;
    }
    func O(): String{
        // Difference to Greenwich time (GMT) in hours
        let os = abs(this.getTimezoneOffset())
        var h = "$(Int(floor(Double(os/60))))"
        var m = "$(os%60)"
        if (h.size == 1) {
            h = "0"+h
        } else {
            h = "1"
        }
        
        if (m.size == 1) {
            m = "0"+m
        } else {
            m = "1"
        }
        
        if (this.getTimezoneOffset() < 0) {
            return "+$(h)$(m)"
        } else {
            return "-$(h)$(m)"
        }
    }
    func r(): String{
        // RFC 822 formatted date
        var r: String
            r = "$(D()),$(j()) $(M()) $(Y()) $(H()):$(i()):$(s()) $(O())"// result
        return r;
    }
    func S(): String{
        // English ordinal suffix for the day of the month, 2 characters
        return daysSuffix[this.getDate()-1];
    }
    func s(): String {
        // Seconds, with leading zeros
        if ("$(this.getSeconds())".size == 1) {
            return "0$(getSeconds())"
        } else {
            return "$(getSeconds())"
        }
    }
    func t(): Int64{
        // thanks to Matt Bannon for some much needed code-fixes here!
        let daysinmonths = [Option<Int64>.None, 31,28,31,30,31,30,31,31,30,31,30,31];
        if (L()==1 && n()==2){
            return 29;// leap day
        }
        return daysinmonths[n()].getOrThrow();
    }
    func U(): Float64{
        // Seconds since the Unix Epoch (January 1 1970 00:00:00 GMT)
        return round(Float64(this.getTime()/1000));
    }
    func W(): String{
   
        let beforeNY = 364+L() - Int64(z());
        let afterNY  = z();
        var weekday = w(); // makes sunday (0), into 6.
        if (w() != 0) {
            weekday =  w() - 1
        } else {
            weekday = 6
        }
        if (beforeNY <= 2 && weekday <= 2-beforeNY) {
            return "1";
        }
        // similarly, if the day is within threedays of newyears
        // there's a chance it belongs in the old year.

        let ny = stringToDate("1/1/$(Y()) 00:00:00")
        var nyDay = ny.getDay();
        if (ny.getDay() != 0) {
            nyDay = ny.getDay()-1
        } else {
           nyDay = 6 
        }
        if (
            (Int64(afterNY) <= 2) &&
            (nyDay >= 4)  &&
            (Int64(afterNY) >= (6-nyDay))
        ) {


            let prevNY = DateClass("December 31 " + "$(Y()-1)" + " 00:00:00")
            return  prevNY.formatDate("W", Option<Int64>.None)
        }

        // week 1, is the week that has the first thursday in it.
        // note that this value is not zero index.
        if (nyDay <= 3) {
            // first day of the year fell on a thursday, or earlier.
            return "$( 1 + Int(floor( ( z() + Double(nyDay) ) / 7 )))";
        } else {
            // first day of the year fell on a friday, or later.
            return "$(1 + Int(floor( ( z() - ( 7 - Double(nyDay) ) ) / 7 )))";
        }
    }
    func w(): Int64{
        // Numeric representation of the day of the week
        return this.getDay();
    }
    func Y(): Int64 {

        if (this.getFullYear() != 0) {
            let newDate = DateClass("January 1 2001 00:00:00 +0000")
            let x = newDate.getYear()
            if (x == 2001) {
                // i trust the method now
                return getFullYear();
            }
        }
 
        let x = this.getYear();
        var y = x % 100;
        if (y < 38) {
            y += 2000
        } else {
            y += 1900
        }
        return y;
    }
    func y(): String {
        // A two-digit representation of a year
        let str = "${Y()}";
        let startIndex = 2
        let endIndex = 3
        let substring = str[Range<Int64>(startIndex, endIndex, 1, true, true, true)]
        return "${substring}"
    }
    func z(): Float64{
        // The day of the year, zero indexed! 0 through 366
        let t =  DateClass("January 1 $(Y()) 00:00:00");
        let diff = this.getTime() - t.getTime();
        return floor(Float64(diff/1000/60/60/24));
    }
    func stringToArray(str: String): ArrayList<String> {
       var arr = ArrayList<String>()
       for (i in 0..str.size) {
           arr.add("$(str[i])")   //wait to confirm
       }
       return arr
   }
    func stringToDate(str: String): MyDate {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
       dateFormatter.timeZone = TimeZone("Asia/Shanghai")
       let dateObject = dateFormatter.newDate(str)
        return dateObject
    }

}

/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
   func run()  {
    let date = DateClass("1/1/2007 01:11:11")
    for (_ in 0..500) {
        let shortformat = date.formatDate("Y-m-d", Option<Int64>.None)
        let longformat = date.formatDate("l, F d, Y g:i:s A", Option<Int64>.None)
        date.setTime(date.getTime()  + 84266956)
     }
   }
   
   /*
   * @Benchmark
   */
   func runIterationTime() {
    let start = Timer().getTime()
    for (_ in 0..80) {
        run()
    }
    let end = Timer().getTime()
    println("date-format-tofte: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
   }
}


class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time 
    }
}

main() {
    Benchmark().runIterationTime()
}
