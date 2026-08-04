/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt %optimization_level_2 --no-sub-pkg %f -o %output
// RUN-EXEC: %export cjHeapSize=1024mb && %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan ms
// TIMEOUT: 1800
import std.convert.*
import std.collection.*
import std.time.*
import std.math.*
import std.regex.*
import std.core.*
import std.convert.*


let obj_string = """

"""





public enum JsonTokenType <: Equatable<JsonTokenType> {
    | objBegin // {
    | objEnd   // }
    | arrBegin // [
    | arrEnd   // ]
    | nullValue_Token    // null
    | num
    | str_Token
    | bool_Token
    | sepColon // :
    | sepComma // ,

   public operator func ==(another: JsonTokenType): Bool {
        match(this) {
            case objBegin =>
            match(another) {
                case objBegin => true
                case _ => false  
            }
            case objEnd =>
            match(another) {
                case objEnd => true
                case _ => false
            }
            case arrBegin =>
            match(another) {
                case arrBegin => true
                case _ => false
            }
            case arrEnd =>
            match(another) {
                case arrEnd => true
                case _ => false
            }
            case nullValue_Token =>
            match(another) {
                case nullValue_Token => true
                case _ => false
            }
            case num =>
            match(another) {
                case num => true
                case _ => false
            }
            case str_Token =>
            match(another) {
                case str_Token => true
                case _ => false
            }
            case bool_Token =>
            match(another) {
                case bool_Token => true
                case _ => false
            }
            case sepColon =>
            match(another) {
                case sepColon => true
                case _ => false
            }
            case sepComma =>
            match(another) {
                case sepComma => true
                case _ => false
            }
        }
    }

    public operator func !=(another: JsonTokenType): Bool {
        match(this) {
            case objBegin =>
            match(another) {
                case objBegin => false
                case _ => true
            }
            case objEnd =>
            match(another) {
                case objEnd => false
                case _ => true
            }
            case arrBegin =>
            match(another) {
                case arrBegin => false
                case _ => true
            }
            case arrEnd =>
            match(another) {
                case arrEnd => false
                case _ => true
            }
            case nullValue_Token =>
            match(another) {
                case nullValue_Token => false
                case _ => true
            }
            case num =>
            match(another) {
                case num => false
                case _ => true
            }
            case str_Token =>
            match(another) {
                case str_Token => false
                case _ => true
            }
            case bool_Token =>
            match(another) {
                case bool_Token => false
                case _ => true
            }
            case sepColon =>
            match(another) {
                case sepColon => false
                case _ => true
            }
            case sepComma =>
            match(another) {
                case sepComma => false
                case _ => true
            }
        }    
    }
}


class JsonToken {
    var tmp_type: JsonTokenType;
    var value: String = ""
    init(tmp_type: JsonTokenType, value: String) {
        this.tmp_type = tmp_type
        this.value = value
    }
}

enum JsonType{
    | obj
    | arr
    | str
    | double
    | int
    | bool
    | nullValue

   public operator func ==(another: JsonType): Bool {
        match(this) {
            case obj =>
            match(another) {
                case obj => true
                case _ => false
            }
            case arr =>
            match(another) {
                case arr => true
                case _ => false
            }
            case str =>
            match(another) {
                case str => true
                case _ => false
            }
            case double =>
            match(another) {
                case double => true
                case _ => false
            }
            case int =>
            match(another) {
                case int => true
                case _ => false
            }
            case bool =>
            match(another) {
                case bool => true
                case _ => false
            }
            case nullValue =>
            match(another) {
                case nullValue => true
                case _ => false
            }
        }
    }

}

class Json {
    var type_json: ?JsonType = Option<JsonType>.None
    var objectValue: ?HashMap<String, Json> = Option<HashMap<String, Json>>.None
    var arrayValue: ?ArrayList<Json> = Option<ArrayList<Json>>.None
    var stringValue: ?String = Option<String>.None
    var doubleValue: ?Float64 = Option<Float64>.None
    var intValue: ?Int64 = Option<Int64>.None
    var boolValue: ?Bool = Option<Bool>.None
    var nullValue: ?String = Option<String>.None
    
    init(tmp_type:?JsonType, value:?Any){

        if (tmp_type.isSome()) {
            this.type_json = tmp_type
        }
        if (value.isSome()) {
            setValue(value.getOrThrow())
        }
        
    }
    
    func getDescription(): String {
        match(this.type_json.getOrThrow()) {
          case nullValue =>
            return "null"
          case str =>
            return "String(${this.stringValue.getOrThrow()})"
          case int =>
            return "Int64(${this.intValue.getOrThrow()})"
          case double =>
          return "Int64(${this.doubleValue.getOrThrow()})"
          case bool =>
            return "Bool(${this.boolValue.getOrThrow()})"
          case obj =>
            var objDesc = StringBuilder("Object(")
            let objSize = objectValue.getOrThrow().keys().size
            var keyCount = 0
            //objectValue.getOrThrow().forEach { (k: String, v: Json) in
            for ( (k, v) in objectValue.getOrThrow()) {
                keyCount += 1
                objDesc.append(k)
                objDesc.append(":")
                objDesc.append(v.getDescription())
                if (keyCount < objSize) {
                    objDesc.append(", ")
                }
            }
            objDesc.append(")")
            return objDesc.toString()
          case arr =>
            var arrDesc = StringBuilder("Array(")
            var arrCount = 0
            let length = this.arrayValue.getOrThrow().size
            for (item in this.arrayValue.getOrThrow()) {
                arrCount += 1
                arrDesc.append(item.getDescription())
                if (arrCount < length) {
                    arrDesc.append(", ")
                }
            }
            arrDesc.append(")")
            return arrDesc.toString()
          case _ =>
            throw Exception("ParserError: json value type is undefined.")

        }
    }
    
    func setValue(value: Any) {
        match (this.type_json.getOrThrow()) {
          case str =>
            this.stringValue = (value as String).getOrThrow()
            return
          case int =>
            this.intValue = (value as Int64)
            return
          case double =>
            this.doubleValue = (value as Float64).getOrThrow()
            return
          case bool =>
            this.boolValue = (value as Bool).getOrThrow()
            return
          case nullValue =>
            this.nullValue = (value as String).getOrThrow()
            return
          case obj =>
            this.objectValue = (value as HashMap<String, Json>).getOrThrow()
            return
          case arr =>
            this.arrayValue = (value as ArrayList<Json>).getOrThrow()
            return
          case _ =>
            throw Exception("ParserError: json value type is undefined.")
        }
    }
    
}


class JsonTokenizer {
    
    var input: String
    
    var currentIndex : Int64
    
    init(string: String) {
        this.input = string
        this.currentIndex = 0
    }
    
   
    private func current(): ?Rune {
        if (currentIndex >= input.size ) {
            return Option<Rune>.None
        }
        return Rune(input[currentIndex])
    }
    
    
    private func peekNext(): ?Rune {
        advance()
        return current()
    }
    
    
    private func advance() {
        currentIndex = currentIndex + 1
    }
    
    private func back() {
        currentIndex = currentIndex - 1
    }
    
    func nextToken(): ?JsonToken {
        scanSpaces()
        let ch = current()
        if (ch.isNone()) {
            return Option<JsonToken>.None
        }
        match(ch.getOrThrow()) {
        case r'{' =>
            advance()
            return JsonToken(objBegin, "{")
        case r'}' =>
            advance()
            return JsonToken(objEnd, "}")
        case r'[' =>
            advance()
            return JsonToken(arrBegin, "[")
        case r']' =>
            advance()
            return JsonToken(arrEnd, "]")
        case r',' =>
            advance()
            return JsonToken(sepComma, ",")
        case r':' =>
            advance()
            return JsonToken(sepColon, ":")
        case r'n' =>
            scanMatch("null")
            return JsonToken(nullValue_Token, "null")
        case r't' =>
            let strTrue = scanMatch("true")
            return JsonToken(bool_Token, strTrue)
        case r'f' =>
            let strFalse = scanMatch("false")
            return JsonToken(bool_Token, strFalse)
        case r'\"' =>
            let str = scanString()
            advance()
            return JsonToken(str_Token, str)
        case _ =>
            if (isNumber(ch.getOrThrow())) {
                let strNum = scanNumbers()
                return JsonToken(num, strNum)
            }
            throw Exception("ParserError: Unparsable character :${ch} - ${currentIndex}")
        }
    }
    
    func scanString(): String {
        var ret= ArrayList<Rune>()
        
        do {
            let ch = peekNext()
            if (ch.isNone()) {
                throw Exception("ParserError: scanString Error,${currentIndex} ")
            }
            
            match(ch.getOrThrow()) {
            case '\\' =>
                let cn = peekNext()
                if (cn.isNone()) {
                    throw Exception("ParserError: Invalid special type character")
                }
                
                ret.add(r'\\')
                ret.add(cn.getOrThrow())
                if (cn == r'u') {
                    ret.add(all: scanUnicode())
                }
            case '\"' =>
                return ret.toString()
            case '\r' =>
                throw Exception("ParserError: Invalid character${ch}")
            case _ =>
                ret.add(ch.getOrThrow())
            }
        }  while(true) 
        return ""
    }
    
    func scanUnicode(): ArrayList<Rune> {
        var ret = ArrayList<Rune>()
        for (_ in 0..4) {
            let ch = peekNext()
            if (ch.isSome() && isHex(ch.getOrThrow())){
                ret.add(ch.getOrThrow())
            } else {
                throw Exception("ParserError: unicode Character irregularities${currentIndex}")
            }
        }
        return ret
    }
    
    func scanNumbers(): String {
        let ind = currentIndex
        while (current().isSome() && isNumber(current().getOrThrow())) {
            advance()
        }
        if (currentIndex != ind) {
            return input[ind..currentIndex]
        }
        throw Exception("ParserError: scanNumbers Error:${ind}")
    }
    
    func scanSpaces() {
        var ch = current()
        while (ch.isSome() && ch.getOrThrow() == r' ') {
            ch = peekNext()
        }
    }
    
    func scanMatch(str: String): String {
        return   scanMatchArr(stringToCharArray(str))
    }
    
    func stringToCharArray(str: String): Array<Rune> {
       var arr = ArrayList<Rune>()
       for (i in 0..str.size) {
           arr.add(Rune(str[i]))  
       }
       return arr.toArray()
   }



    func scanMatchArr(characters: Array<Rune>): String {
        let ind = currentIndex
        var isMatch = true
        for (index in (0..characters.size)) {
            if (characters[index] != current().getOrThrow()) {
                isMatch = false
                break
            }
            advance()
        }
        if (isMatch) {
            return input[ind..currentIndex]
        }
        throw Exception("ParserError: scanUntil dissatisfy ${characters}")
    }
    
    func isEscape(c: Rune): Bool {
        // \" \\ \u \r \\n \b \t \f
        return [r'\"', r'\\', r'u', r'r', r'n', r'b', r't', r'f'].contains(c)
    }
    
    func isNumber(c: Rune): Bool {
        let chars = HashMap<Rune, Bool>([
            (r'-', true),
            (r'+', true),
            (r'e', true),
            (r'E', true),
            (r'.', true)
        ])
        let b: ?Bool = chars.get(c)
        if (b.isSome()) {
            return true
        }
        
        if(c >= r'0' && c <= r'9') {
            return true
        }
        
        return false;
    }

    
    func isHex(c: Rune): Bool {
        return (c >= r'0' && c <= r'9') || (c >= r'a' && c <= r'f') || (c >= r'A' && c <= r'F')
    }
}

class JsonParser {
    private var tokenizer: JsonTokenizer
    
    private init(text: String) {
        tokenizer = JsonTokenizer(text)
    }
    
    static func parse_ALL(text: String): ?Json {
        var parser = JsonParser(text)
        return parser.parse()
    }
    
    
    private func parseElement(): ?Json {
        let nextToken = tokenizer.nextToken()
        if (nextToken.isNone()) {
            return Option<Json>.None
        }
        
        match(nextToken.getOrThrow().tmp_type) {
        case arrBegin =>
            return Json(arr, parserArr())
        case arrEnd =>
            return Json(str, "]")
        case objBegin =>
            return Json(obj, parserObj())
        case bool_Token =>
            return Json(bool, nextToken.getOrThrow().value == "true")
        case nullValue_Token =>
            return Json(nullValue, "null")
        case str_Token =>
            return Json(str, nextToken.getOrThrow().value)
        case num =>
            if (nextToken.getOrThrow().value.contains("."))  {
                return Json(double, Float64.parse(nextToken.getOrThrow().value))
            } else {
                return Json(int, Int64.parse(nextToken.getOrThrow().value))
            }
        case _ =>
            throw Exception("unknown element: nextToken.getOrThrow().tmp_type")
        }
    }
    
    private func parserArr(): ArrayList<Json> {
        var arr = ArrayList<Json>()
        
        do {

            let ele = parseElement()
            
            if (ele.isNone()) {
                throw Exception("ParserError: parserArr parsing failure")
            }
            
            if  (ele.getOrThrow().getDescription() == "String(])") {
                break;
            }else{
                arr.add(ele.getOrThrow())
            }

            let next = tokenizer.nextToken()
            if (next.isNone()) {
                throw Exception("ParserError: parserArr parsing failure")
            }
            
            if (next.getOrThrow().tmp_type == arrEnd) {
                break
            }
            
            if (next.getOrThrow().tmp_type != sepComma) {
                throw Exception("ParserError: parserArr parsing failure")
            }
            
        } while (true)

        return arr
    }
    
    private func parserObj(): HashMap<String, Json> {
        var obj = HashMap<String, Json>()

        do {
            let next = tokenizer.nextToken()
            
            if (next.isNone()) {
                throw Exception("ParserError: parserObj error, does not exist key");
            }
            
            let key = next.getOrThrow().value
            
            if (next.getOrThrow().value == "}")  {
                return obj
            }

            if (obj.contains(key)) {
                throw Exception("ParserError: parserObj error, exist key: ${key}")
            }

            let comma = tokenizer.nextToken()
            if (comma.isNone() || JsonTokenType.sepColon != comma.getOrThrow().tmp_type) {
                throw Exception("ParserError: parserObj error:inexistence")
            }
            
            let value = parseElement()
            if (value.isNone()) {
                throw Exception("ParserError: parserObj error:inexistence")
            }

            obj[key] = value.getOrThrow()
            
            let nex = tokenizer.nextToken()
            if (nex.isNone()) {
                throw Exception("ParserError: parserObj error, the next value does not exist")
            }
            
            if (JsonTokenType.objEnd == nex.getOrThrow().tmp_type) {
                break
            }
            if (JsonTokenType.sepComma != nex.getOrThrow().tmp_type) {
                throw Exception("ParserError: parserObj error, does not exist")
            }
        } while (true)

        return obj
    }
    
    private func parse(): ?Json {
        let token = tokenizer.nextToken()
        if (token.isNone()) {
            return Option<Json>.None
        }
        
        match(token.getOrThrow().tmp_type) {
        case arrBegin =>
            return Json(arr, parserArr())
        case objBegin =>
            return Json(obj, parserObj())
        case _ =>
            return Option<Json>.None
        }
    }
    
}
/*
 *  @State
 *  @Tags Jetstream2
 */
class Benchmark {
    /*
     * @Benchmark
     */
    func runIteration(){
        let startTime = Timer().getTime()
        for (_ in  0..5) {
            let result = JsonParser.parse_ALL(obj_string)
            // debugLog(result!.getDescription())
        }
        let endTime = Timer().getTime()
        println("json-parse-inspector: ms =  ${Float64((endTime - startTime).toNanoseconds())/1000000.0}")
    }
    
}

func debugLog(object: String) {
    let isLog = false
    if (isLog) {
        println(object)
    }
}

class Timer {
    public func getTime() {
        let time = DateTime.now()
        return time
    }

}

main() {
    Benchmark().runIteration()
}
