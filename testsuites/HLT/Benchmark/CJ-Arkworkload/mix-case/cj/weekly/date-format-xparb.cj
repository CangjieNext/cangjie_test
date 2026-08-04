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
    public func getDate(): Int64 {
        
        return 1
    }
    public func getTimezoneOffset(): Int64{
        
        return  -480
    }
    public func getYear(): Int64{
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
class DateClass <: MyDate {
    
    var daysInMonth = [31,28,31,30,31,30,31,31,30,31,30,31];
    let monthNames = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"];
    let dayNames = [
        "Sunday",
        "Monday",
        "Tuesday",
        "Wednesday",
        "Thursday",
        "Friday",
        "Saturday"];
    init(str: String) {
        super()
        
    }
    func dateFormat(format: String): String{
        return createNewFormat(format)
    }
    
    func createNewFormat(format: String): String {
        var result = StringBuilder("")
        var special = false
        for (ch in format) {
            if (!special && Rune(ch) == r'\\'){
                special = true
            }else if (special) {
                special = false
                result.append(ch)
            }else  {
                let value = getFormatCode(Rune(ch))
                result.append(value)
            }
        }
        return result.toString()
    }
    
    func getFormatCode(character: Rune): String {
        match (character) {
            case 'd' => return leftPad(getDate(), 2, "0")
            case 'D' => return substring("${dayNames[getDay()]}", 0, 2)
            case 'j' => return getDate().toString()
            case 'l' => return dayNames[getDay()]
            case 'S' => return getSuffix()
            case 'w' => return getDay().toString()
            case 'z' => return getDayOfYear().toString()
            case 'W' => return getWeekOfYear()
            case 'F' => return monthNames[getMonth() - 1]
            case 'm' => return leftPad(getMonth(), 2, "0")
            case 'M' => return substring(monthNames[getMonth()], 0, 2)
            case 'n' => return (getMonth() + 1).toString()
            case 't' => return getDaysInMonth().toString()
            case 'L' =>
                if (isLeapYear() == true) {
                    return "1"
                } else {
                    return "0"
                }
            case 'Y' => return getFullYear().toString()
            case 'y' => return substring(getFullYear().toString(), 2, 3)
            case 'a' =>
                if (getHours() < 12) {
                    return "am"
                } else {
                    return "pm"
                }
            case 'A' =>
                if (getHours() < 12) {
                    return "AM"
                } else {
                    return "PM"
                }
            case 'g' =>
                if ((getHours()%12) != 0) {
                    return (getHours() % 12).toString()
                } else {
                    return "12"
                }
            case 'G' => return getHours().toString()
            case 'h' =>
                if ((getHours()%12) != 0) {
                    return leftPad(getHours() % 12, 2, "0")
                } else {
                    return leftPad(12, 2, "0")
                }
            case 'H' => return leftPad(getHours(), 2, "0");
            case 'i' => return leftPad(getMinutes(), 2, "0")
            case 's' => return leftPad(getSeconds(),2 , "0");
            case 'O' => return getGMTOffset();
            case 'Z' => return (getTimezoneOffset() * -60).toString()
            case _ => return String(character);
        }
    }
    func getGMTOffset(): String {
        if (getTimezoneOffset() > 0) {
            return "-" + leftPad(Int64(floor(Float64(getTimezoneOffset() / 60))), 2, "0")
                + leftPad(getTimezoneOffset() % 60,  2, "0")
        } else {
            return "+" + leftPad(Int64(floor(Float64(getTimezoneOffset() / 60))), 2, "0")
                + leftPad(getTimezoneOffset() % 60,  2, "0")
        }
        
    }
    
    func getDayOfYear(): Int64 {
        var num = 0;
        daysInMonth[1] = 28
        if (isLeapYear() == true) {
            daysInMonth[1] = 29
        }
        
        for (i in 0..getMonth()) {
            num += daysInMonth[i]
        }
        return num + getDate() - 1;
    }
    
    func getWeekOfYear(): String {
        // Skip to Thursday of this week
        let now = getDayOfYear() + (4 - getDay());
        // Find the first Thursday of the year
        let jan1 =  DateClass("${this.getFullYear()}, 0, 1");
        let then = (7 - jan1.getDay() + 4);
        return leftPad(((now - then) / 7) + 1, 2,"0");
    }
    
    func isLeapYear(): Bool {
        let year = getFullYear();
        return ((year & 3) == 0 && (((year % 100) != 0) || (year % 400 == 0 && (year != 0))));
    }
    func getDaysInMonth(): Int64 {
        daysInMonth[1] = 28
        if (isLeapYear() == true) {
            daysInMonth[1] = 29
        }
        return daysInMonth[getMonth()];
    }
    
    func getSuffix(): String {
        match  (getDate()) {
        case 1 | 21 | 31 => return "st";
        case 2 | 22 => return "nd";
        case 3 | 23 => return "rd";
        case _ => return "th";
        }
    }
    func leftPad(val: Int64, size: Int64, ch1: ?String): String {
        var ch = ch1
        var result = val.toString()
        if (ch == Option<String>.None) {
            ch = " "
        }
        while (result.size < size) {
            result = ch.getOrThrow() + result
        }
        return result
    }
    
    func substring(str: String ,startOffset: Int64, endOffset: Int64): String {
        let startIndex = startOffset
        let endIndex = endOffset
        
        let substring = str[Range<Int64>(startIndex, endIndex, 1, true, true, true)]
        return substring
    }
}
/*
 * @State
 * @Tags Jetstream2
 */
class Benchmark {
 
   func run() {
    let date =  DateClass("1/1/2007 01:11:11")
    for (_ in 0..500) {
        let shortFormat = date.dateFormat("Y-m-d")
        let longFormat = date.dateFormat("l, F d, Y g:i:s A")
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
    println("date-format-xparb: ms = ${Float64((end-start).toNanoseconds())/1000000.0}")
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

//interface Patterns  {
//  ISO8601LongPattern:"Y-m-d H:i:s",
//  ISO8601ShortPattern:"Y-m-d",
//  ShortDatePattern: "n/j/Y",
//  LongDatePattern: "l, F d, Y",
//  FullDateTimePattern: "l, F d, Y g:i:s A",
//  MonthDayPattern: "F d",
//  ShortTimePattern: "g:i A",
//  LongTimePattern: "g:i:s A",
//  SortableDateTimePattern: "Y-m-d\\TH:i:s",
//  UniversalSortableDateTimePattern: "Y-m-d H:i:sO",
//  YearMonthPattern: "F, Y"};
