// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// 2.1 数值类型
let a: UInt8 = 128
let b: Byte = a // ok
let c: Int64 = 9223372036854775807
let d: Int = c // ok
let e: UInt64 = 18446744073709551615
let f: UInt = e // ok

// 2.1.1.1 数值类型字面量
// 整数类型字面量
func  int() {
    let a = 0b0001_1000 // Binary.
    let b = 0o30 // Octal.
    let c = 24 // Decimal.
    let d = 0x18 // Hexadecimal.
}

// 浮点数类型
func  float() {
    let a = 3.14 // decimal Float64 3.14.
    let b = 2.4e-1 // decimal Float64 0.24.
    let c = 2e3 // decimal Float64 2000.0.
    let d = .8 // decimal Float64 0.8.
    let e =.123e2 // decimal Float64 12.3.
    let f = 0x1.1p0 // hexadecimal Float64 1.0625 (decimal value).
    let g = 0x1p2 // hexadecimal Float64 4 (decimal value).
    let h = 0x.2p4 // hexadecimal Float64 2 (decimal value).
}

// 2.1.1.2 数值类型支持的操作符

// 算术操作符
func  op1() {
    let a = 2 + 3 // add result: 5
    let b = 3 - 1 // sub result: 2
    let c = 3 * 9 // mul result: 27
    let d = 24 / 8 // div result: 3
    let e = 7 % 3 // mod result: 1
    let f = 2 ** 3 // power result: 8
    let g = 5 + 15 - 2 * 10 / 4 // result: 15
    let h = 5 + 10 - 3 * 4 ** 2 / 3 % 5 // result: 14
}

// 位操作符
func  op2() {
    let a = !10 // bitwise logical NOT operator: -11
    let b = 10 << 1 // left shift operator: 10*2=20
    let c = 10 >> 1 // right shift operator: 10/2=5
    let d = 10 & 15 // bitwise logical AND operator: 10
    let e = 10 ^ 15 // bitwise XOR operator: 5
    let f = 10 | 15 // bitwise logical OR operator: 15
    let g = 0b1010 & 0b1110 ^ 0b1111 | 0b0101 // result: 0b0101
}

// 关系操作符
func  op3() {
    let a = 2 == 3 // result: false
    let b = 2 != 3 // result: true
    let c = 8 < 10 // result: true
    let d = 9 <= 9 // result: true
    let e = 24 > 28 // result: false
    let f = 24 >= 23 // result: true
}

// 自增（减）操作符
func  op4() {
    var i: Int32 = 5
    var j: Int32 = 6
    i++ // i=6
    j-- // j=5
    return 0
}

// 一元负号操作符
func  op5() {
    var i: Int32 = 5
    var j: Int64 = 100
    var k: Int32 = -i // k = -5
    var l: Int64 = -j // l = -100
}

// （复合）赋值操作符
func  op6() {
    var x: Int64 = 5
    var y: Int64 = 10
    x = y // assignment: x = 10
    x += y // compound assignment: x = 20
    x -= y // x = 10
    x *= y // x = 100
    x /= y // x = 10
    x %= y // x = 0
    x = 5 // x = 5
    x **= 2 // x = 25
    x <<= 1 // x = 50
    x >>= 2 // x = 12
    x &= y // x = 8
    x ^= y // x = 2
    x |= y // x = 10
    return 0
}

//（复合）赋值操作符
func  op6() {
    let x = NaN
    var y = 3.14
    var z = x < y // z = false
    var v = x != x // v = true
    var w = (x < y) == !(x >= y) // w = false
}

// 2.1.2 Rune 类型
func  rune() {
    let a: Rune = r'a'
    let b: Rune = r"b"

    let slash: Rune = r'\\'
    let newLine: Rune = r'\n'
    let tab: Rune = r'\t'

    let he: Rune = r'\u{4f60}'
    let llo: Rune = r'\u{597d}'
    'A'=='A' // result: true
    'A'!='A' // result: false
    'A'<'a' // result: true
    'A'<='A' // result: true
    'A'>'a' // result: false
    'A'>='A' // result: true
    return 0
}

// 2.1.3 Bool 类型
func  bool() {
    let a: Bool = true
    let b: Bool = false
    let bool1: Bool = true
    var bool2: Bool = false
    bool2 = true // assignment
    bool2 &&= bool1 // bool2=true
    bool2 ||= bool1 // bool2=true
    true == false // return false
    true != false // return true
    !false // logical NOT, return true
    true && false // logical AND, return false
    false || false // logical OR, return false
    return 0
}

// 2.1.6.1 String 字面量
// 单行字符串字面量
func  str1() {
    let s1 = "" // empty string
    let s2: String = "Hello Cangjie Lang" // define string s2
    var s3 = "\"Hello Cangjie Lang\"" // define string s3 containing character "
    var s4: String = "Hello Cangjie Lang\n" // define string s4 containing character \n
}

// 多行字符串字面量
func  str2() {
    // empty multi-line string
    let s1 = """
    """

    /* The result of s2 is: This is a multi-line string */
    let s2 = """
    This
    is a multi-line string"""

    /* The result of s3 is: This is a multi-line string */
    let s3 = """
    This
    is a multi-line string"""

    /*
    The result of s4 is:
    This
    is a
    multi-line string
    */
    let s4 = """
    This
    is a
    multi-line string
    """

    /*
    The result of s5 is:
    This is a
    multi-line string
    */
    let s5 = """
    This is a\n
    multi-line string
    """
}

// 多行字符串字面量
func  str3() {
    // empty multi-line raw string
    let empty1 = #""#
    // empty multi-line raw string
    let empty2 = ##""##

    /*
    The result of s2 is:
    This
    is a multi-line string
    */
    let s2 = ##"
    This
    is a multi-line raw string"##

    /*
    The result of s3 is:
    This is a\n
    multi-line string
    */
    let s3 = #"This is a\n
    multi-line string"#

    /*
    The result of s4 is:
    This is a "#
    */
    let s4 = ##" This is a "#
    "##
}

// 2.1.6.2 插值字符串
func  str4() {
    let obj = "apples"
    let count = 10
    let interps1 = "There are ${count * count} ${obj}."

    let d1 = "The $ sign."
    // The result of "d1" is: The $ sign.
    let d2 = "The \${v}."
    // The result of "d2" is: The ${v}.
}

// 2.1.7 Tuple 类型
func  tuple1() {
    let x: (Int64, Float64) = (3, 3.141592)
    let y: (Int64, Float64, String) = (3, 3.141592, "PI")
}

// 2.1.7.2 使用元组做解构
func  multiValues(a: Int32, b: Int32): (Int32, Int32) {
    return (a + b, a - b) // The type of the return value of the function multiValues is (Int32, Int32).
}

func  tuple2() {
    var (x, y) = multiValues(8,24) // Define an anonymous tuple who has two elements, i.e., x and y.
    print("${x}") // output: 32
    print("${y}") // output: -16
    return 0
}

// 2.1.7.3 元组的下标访问
func  tuple3() {
    var z = multiValues(8, 24) // the type of z is inferred to be (Int32, Int32)
    print("${z[0]}") // output: 32
    print("${z[1]}") // output: -16
    return 0
}

// 2.1.7.4 定义元组类型的变量
func  tuple4() {
    let tuplePIE = (3.14, "PIE") // The type of tuplePIE is inferred to be (Float64, String).
    var pointOne = (2.4, 3.5) // The type of pointOne is inferred to be (Float64, Float64).
    var pointTwo = (2, 3, 4) // The type of pointTwo is inferred to be (Int64, Int64, Int64).
    var pointThree = ((2, 3), 4) // The type of pointThree is inferred to be ((Int64, Int64), Int64).
}

// 2.1.8.1 创建 Range 实例
func  range() {
    let r1 = Range<Int64>(0, 10, 1, true, true, true)
    let r2 = Range<Int64>(0, 10, 1, true, true, false)
    let r3 = Range<Int64>(10, 0, -2, true, true, false)

    let n = 10
    let r1 = 0..10 : 1
    let r2 = 0..=n : 1
    let r3 = n..0 : -2
    let r4 = 10..=0 : -2

    let r5 = 0..10
    let r6 = 0..10 : 0

    let r7 = 10..0 : 1
    let r8 = 0..10 : -1
    let r9 = 10..=0 : 1
    let r10 = 0..=10 : -1
    let range11 = 1..10 // Define a half-open range [1, 10) with step = 1.
    let range12 = 1..=10 // Define a closed range [1, 10] with step = 1.
    let range16: Range<Int64> = 0..10 // Define a half-open range [0,10) with step = 1
    let range17: Range<Int64> = -10..10:2 // Define a half-open range [-10,10) with step = 2
    let range18 = 0..=10 // Define a closed range [0,10] with step = 1
    let range19 = -10..=10:2 // Define a closed range [-10,10] with step = 2
}

// 2.1.9 Function 类型
func  display(a: Int64): Unit {
    println(a)
}

func  add(a: Int64, b: Int64): Int64 {
    a + b
}

func  returnTuple(a: Int64, b: Int64): (Int64, Int64) {
    (a, b)
}

func  showFruitPrice(name: String, price: Int64) {
    println("fruit: ${name} price: ${price} yuan")
}

func  showFruitPrice1() {
    let fruitPriceHandler: (name: String, price: Int64) -> Unit
    fruitPriceHandler = showFruitPrice
    fruitPriceHandler("banana", 10)
}

func  printAdd(add: (Int64, Int64) -> Int64, a: Int64, b: Int64): Unit {
    println(add(a, b))
}

func  returnAdd(): (Int64, Int64) -> Int64 {
    add
}

func  returnAdd1() {
    var a = returnAdd()
    println(a(1,2))
}

let  f: (Int64, Int64) -> Int64 = add

func  add1(i: Int64, j: Int64) {
    i + j
}

func  add1(i: Float64, j: Float64) {
    i + j
}

func  add12() {
    var plus: (Int64, Int64) -> Int64 = add  // OK
}

// 2.1.10.1 enum 类型声明
enum TimeUnit1 {
    Year | Month | Day | Hour
}

enum TimeUnit2 {
    | Year(Float32)
    | Month(Float32, Float32)
    | Day(Float32, Float32, Float32)
    | Hour(Float32, Float32, Float32, Float32)
}

enum TimeUnit3<T1, T2> {
    | Year(T1)
    | Month(T1, T2)
    | Day(T1, T2, T2)
    | Hour(T1, T2, T2, T2)
}

enum E {
    A | B | C | ...
}

enum E {
    | mkE // OK. The type of mkE is E but not () -> E.
}

enum E1 {
    | A
}
let a = A // ok, a: E1

enum E2 {
    | B(Bool)
}
let b = B // error

enum E3 {
    | C
    | C(Bool)
}
let c = C // ok, c: E3

enum TimeUnit4 {
    | Year
    | Year(Int32) // ok
    | Year(Float32) // error: redeclaration of 'Year'
    | Month(Int32, Float32) // ok
    | Month(Int32, Int32) // error: redeclaration of 'Month'
    | Month(Int32) // ok
    | Day(Int32, Float32, Float32) // ok
    | Day(Float32, Float32, Float32) // error: redeclaration of 'Day'
    | Day(Float32, Float32) // ok
    | Hour(Int32, Float32, Float32, Float32) // ok
    | Hour(Int32, Int32, Int32, Int32) // error: redeclaration of 'Hour'
    | Hour(Int32, Int32, Int32) // ok
}

// recursive enum
enum TimeUnit5 {
    | Year(Int32)
    | Month(Int32, Float32)
    | Day(Int32, Float32, Float32)
    | Hour(Int32, Float32, Float32, Float32)
    | Twounit(TimeUnit5, TimeUnit5)
}

// mutually recursive enums
enum E1 {
    A | B(E2)
}
enum E2 {
    C(E1) | D(E1)
}

// 2.1.10.2 Enum 值的访问
let time1 = TimeUnit1.Year
let time2 = TimeUnit2.Month(1.0, 2.0)
let time3 = TimeUnit3<Int64, Float64>.Day(1, 2.0, 3.0)
let time4 = Year // syntax sugar of 'TimeUnit1.Year'
let time5 = Month(1.0, 2.0) // syntax sugar of 'TimeUnit2.Month(1.0, 2.0)'
let time6 = Day<Int64, Float64>(1, 2.0, 3.0) // syntax sugar of 'TimeUnit3<Int64, Float64>.Day(1, 2.0, 3.0)'

func g() {
    let a = A // ok, find p.A
    let b = E.A // ok
    let c = p.A // ok
    F(1) // ok, find p.F
    E.F(1) // ok
    p.F(1) // ok
    let x: C // ok, find p.C
    let y: p.C // ok
}

enum E<T> {
    | A(T)
    | B(T)
}

func f() {
    let a = A(1) // ok, a: E<Int64>
    let b = A<Int32>(2) // ok, b: E<Int32>
}

// 2.1.10.3 enum 解构
let time12 = TimeUnit1.Year
let howManyHours = match (time12) {
    case Year => 365 * 24 // matched
    case Month => 30 * 24
    case Day => 24
    case Hour => 1
}

let time13 = TimeUnit2.Month(1.0, 1.5)
let howManyHours = match (time13) {
    case Year(y) => y * 365.0 * 24.0
    case Month(y, m) => y * 365.0 * 24.0 + m * 30.0 * 24.0 // matched
    case Day(y, m, d) => y * 365.0 * 24.0 + m * 30.0 * 24.0 + d * 24.0
    case Hour(y, m, d, h) => y * 365.0 * 24.0 + m * 30.0 * 24.0 + d * 24.0 + h
}

enum E {
    A | B | C | ...
}
func g(e: E): Unit {
    match(e) {
        case A => println("A")
        case B => println("B")
        case _ => println("others")
    }
}

enum Foo {
    A | B | C
    func f1() {
        f2(this)
    }
    static func f2(v: Foo) {
        match (v) {
            case A => 0
            case B => 1
            case C => 2
        }
    }
    prop item: Int64 {
        get() {
            f1()
        }
    }
}

// 2.1.10.5 Option 类型
let opInt32_1 = Some(100) // The type of 'opInt32_1' is 'Option<Int32>'
let opInt32_2 = Option<Int32>.None // The type of 'opInt32_2' is 'Option<Int32>'
let opChar = Some('m') // The type of 'opChar' is 'Option<Rune>'
let opBool = Option<Bool>.None // The type of 'opBool' is 'Option<Bool>'
let opEnum = Some(TimeUnit1.Year) // The type of 'opEnum' is 'Option<TimeUnit1>'

func  option() {
    let number1 = match (opInt32_1) {
        case Some(num) => num // matched
        case None => 0
    }
    let number2 = match (opInt32_2) {
        case Some(num) => num
        case None => 0 // matched
    }
    let enumValue = match (opEnum) {
        case Some(tu) => match (tu) {
            case Year => "Year" // matched
            case Month => "Month"
            case Day => "Day"
            case Hour => "Hour"
        }
        case None => "None"
    }
}

let number1 = opInt32_1.getOrThrow() // number1 = 100
let number2 = opInt32_2.getOrThrow() // throw NoneValueException
let number3 = opInt32_2.getOrThrow{ MyException("Get None value") } // throw MyException
let number4 = opInt32_1 ?? 0 // number1 = 100
let number5 = opInt32_2 ?? 0 // number2 = 0

class C {
    var item = 100
}
let c = C()
let c1 = Some(c)
let c2 = Option<C>.None
let r1 = c1?.item // r1 = Option<Int64>.Some(100)
let r2 = c2?.item // r2 = Option<Int64>.None

// 2.2.1 Array 类型
// Array<T>()
let emptyArr1 = Array<Int64>() // create an empty array whose type is Array<Int64>
let emptyArr2 = Array<String>() // create an empty array whose type is Array<String>
// Array<T>(size: Int64, initElement: (Int64)->T)
let array3 = Array<Int64>(3) { i => i * 2 } // 'array3' has 3 elements: 0, 2, 4
let array4 = Array<String>(2) { i => "$i" } // 'array4' has 2 elements: "0", "1"

let emptyArray: Array<Int64> = [] // empty Array<Int64>
let array0 = [1, 2, 3, 3, 2, 1] // array0 = [1, 2, 3, 3, 2, 1]
let array1 = [1 + 3, 2 + 3, 3 + 3] // array1 = [4, 5, 6]

// 2.2.1.2 访问 Array 中的元素
let array5 = [0, 1]
let element0 = array5[0] // element0 = 0
let array6 = [[0.1, 0.2], [0.3, 0.4]]
let element01 = array6[0][1] // element01 = 0.2

func access() {
    array5[1] = 10 // change the value of the second element of 'array5' through index
    array6[1][1] = 4.0 // change the value of the last element of 'array6' through index
    let array8 = [1, 8, 0, 1, 0]
    for (num in array8) {
        print("${num}") // output: 18010
    }
}

// 2.2.1.3 访问 Array 的大小
let array9 = [0, 1, 2, 3, 4, 5]
let array10 = [[0, 1, 2], [3, 4, 5]]
let size1 = array9.size // size1 = 6
let size2 = array10.size // size2 = 2

// 2.2.1.4 Array 的切片
let array7 = [0, 1, 2, 3, 4, 5]
func slicingTest() {
    array7[0..5] // [0, 1, 2, 3, 4]
    array7[0..5:1] // [0, 1, 2, 3, 4]
    array7[0..5:2] // runtime exception
    array7[5..0:-1] // runtime exception
    array7[5..0:-2] // runtime exception
    array7[0..=5] // [0, 1, 2, 3, 4, 5]
    array7[0..=5:1] // [0, 1, 2, 3, 4, 5]
    array7[0..=5:2] // runtime exception
    array7[5..=0:-1] // runtime exception
    array7[5..=0:-2] // runtime exception
    array7[..4] // [0, 1, 2, 3]
    array7[2..] // [2, 3, 4, 5]
    array7[..] // [0, 1, 2, 3, 4, 5]
    array7[..=4] // [0, 1, 2, 3, 4]
    array7[0..5:-1] // runtime exception
    array7[5..=0] // []
    array7[..0] // []
    array7[..=-1] // []

    let temp: Array<Int64> = array7[..]
    temp[0] = 6 // temp == array7 == [6, 1, 2, 3, 4, 5]

    let arr = [1, 2, 3, 4, 5]
    arr[..] = 0
    // arr = [0, 0, 0, 0, 0]
    arr[0..2] = 1
    // arr = [1, 1, 0, 0, 0]
    arr[0..2] = [2, 2]
    // arr = [2, 2, 0, 0, 0]
    arr[0..2] = [3, 3, 3] // runtime exception
    arr[0..2] = [4] // runtime exception

    let arr2 = [1, 2, 3, 4, 5]
    arr[0..2] = arr2[0..2] // ok
    // arr = [1, 2, 0, 0, 0]
    arr[0..2] = arr2 // runtime exception
    arr[..] = arr2
}

// 2.2.2 VArray 类型
// 2.2.2.1 创建 VArray 实例
let arr1: VArray<Int64, $5> = [1,2,3,4,5]
let arr2: VArray<Int16, $0> = []
// VArray<T, $N>(initElement: (Int64)->T)
let arr5: VArray<Int64, $5> = VArray<Int64, $5> { i => i } // [0, 1, 2, 3, 4]
// VArray<T, $N>(item!: T)
let arr6: VArray<Int64, $5> = VArray<Int64, $5>(item: 0) // [0, 0, 0, 0, 0]

// 2.2.2.2 访问 VArray 中的元素
func varray() {
    var arr7: VArray<Int64, $2> = [0, 1]
    let element0 = arr7[0] // element0 = 0
    arr7[1] = 10 // change the value of the second element of 'arr7' through index
    // Get and Set of multi-dimensional VArrays.
    var arr8: VArray<VArray<Int64, $2>, $2> = [[1, 2], [3, 4]]
    let arr9: VArray<Int64, $2> = [0, 1]
    let element1 = arr8[1][0] // element1 = 3
    arr8[1][1] = 5 // error: function call returns immutable value
    arr8[1] = arr9 // arr8 = [[1, 2], [0, 1]]

}

// 2.2.2.3 获取 VArray 的长度
let arr9: VArray<Int64, $6> = [0, 1, 2, 3, 4, 5]
let size = arr9.size // size = 6

// 2.2.2.4 VArray 在函数签名中时
func mergeVArray(a: VArray<Int64,$2>, b: VArray<Int64, $3>): VArray<Int64, $5> {
    var ret = VArray<Int64, $5>(item: 0)
    for(i in 0..2) {
        ret[i] = a[i]
    }
    for (i in 0..3) {
        ret[a.size + i] = b[i]
    }
    return ret
}

// 2.2.3 struct 类型
struct  Rectangle1 {
    let width1: Int32
    let length1: Int32
    let perimeter1: () -> Int32

    init (width1: Int32, length1: Int32) {
        this.width1 = width1
        this.length1 = length1
        this.perimeter1 = { => 2 * (width1 + length1) }
    }

    init (side: Int32) {
        this(side, side)
    }

    func area1(): Int32 { width1 * length1 }
}

// Define a generic struct type.
struct  Rectangle2<T> {
    let width2: T
    let length2: T

    init (side: T) {
        this.width2 = side
        this.length2 = side
    }

    init (width2!: T, length2!: T) {
        this.width2 = width2
        this.length2 = length2
    }
}

struct  R1 { // error: 'R1' cannot have a member that recursively contains it
    let other: R1
}

struct  R2 { // ok
    let other: Array<R2>
}

struct  R3 { // error: 'R3' cannot have a member that recursively contains it
    let other: R4
}

struct  R4 { // error: 'R4' cannot have a member that recursively contains it
    let other: R3
}

struct R5 { // ok
    let other: E1
}

enum E1 { // ok
    A(R5)
}

struct Test{
    static let counter: Int64 = 3
    let name: String = "afdoaidfad"
    private Test(
        name: String, // regular parameter
        annotation!: String = "nnn", // regular parameter
        var width!: Int64 = 1, // member variable parameter with initial value
        private var length!: Int64, // member variable parameter
        private var height!: Int64 = 3 // member variable parameter
    ) {}
}

struct B<X,Y> {
    B(
        x: Int64, // primary constructor, it's name is the same as the struct
        y: X,
        v!: Int64 = 1, // regular parameter
        private var z!: Y // member variable parameter
    ) {}
    /* The corresponding init constructor with primary constructor auto-generated by compiler.
    private var z: Y // auto generated member variable definition
    init( x: Int64, y: X, v!: Int64 = 1, z!: Y) { // auto generated named parameter definition
        this.z = z // auto generated assign expression of member variable
    }
    */
}

// 2.2.3.5 struct 的实例化
let newRectangle1_1 = Rectangle1(100, 200) // Invoke the first custom constructor.
let newRectangle1_2 = Rectangle1(300) // Invoke the second custom constructor.

let newRectangle2_1 = Rectangle2<Int32>(100) // Invoke the custom constructor.
let newRectangle2_1 = Rectangle2<Int32>(width2: 10, length2: 20) // Invoke another custom constructor.

// 2.3.1 Value Types 之间的类型转换
func  cover1() {
    var c: Rune = 'a'
    var num: UInt32 = 0
    num = UInt32(c) // num = 97
    num -= 32 // num = 65
    c = Rune(num) // c = `A`
    return 0
}

func  cover2() {
    var c: Rune = 'a'
    var num: UInt32 = 0
    num = UInt32(c) // num = 97
    num -= 32 // num = 65
    c = Rune(num) // c = `A`
    return 0
}

func  cover3() {
    var u16Number: UInt16 = 65535
    var u32Number: UInt32 = 0
    u32Number = UInt32(u16Number) // ok: u32Number = 65535
    u16Number = UInt16(u32Number) // ok: u16Number = 65535
    u32Number = 65536
    u16Number = UInt16(u32Number) // throw an ArithmeticException
    return 0
}

func  cover4() {
    var f32Number: Float32 = 1.1
    var f64Number: Float64 = 0.0
    f64Number = Float64(f32Number) // f64Number = 1.100000023841858
    f32Number = Float32(f64Number) // f32Number = 1.1
    f64Number = 1.123456789
    f32Number = Float32(f64Number) // f32Number = 1.1234568
    f32Number = 4.4E38 // f32Number = POSITIVE_INFINITY
    f64Number = Float64(f32Number) // f64Number = POSITIVE_INFINITY
    f64Number = 4.4E38
    f32Number = Float32(f64Number) // f32Number = POSITIVE_INFINITY
    f64Number = Float64(f32Number*0.0)
    f32Number = Float32(f64Number) // f32Number = NaN
    return 0
}

func  cover5() {
    var i8Number: Int8 = 127
    var u8Number: UInt8 = 0
    u8Number = UInt8(i8Number) // ok: u8Number = 127
    u8Number = 100
    i8Number = Int8(u8Number) // ok: i8Number= 100
    i8Number= -100
    u8Number = UInt8(i8Number) // throw an ArithmeticException
    u8Number = 255
    i8Number = Int8(u8Number) // throw an ArithmeticException
    return 0
}

func  cover6() {
    var i32Number: Int32 = 1024
    var f16Number: Float16 = 0.0
    var f32Number: Float32 = 0.0
    f16Number = Float16(i32Number) // ok: f16Number = 1024.0
    f32Number = Float32(i32Number) // ok: f32Number = 1024.0
    i32Number = 2147483647
    f16Number = Float16(i32Number) // f16Number = POSITIVE_INFINITY
    f32Number = Float32(i32Number) // precision lost: f32Number = 2.14748365E9
    f32Number = 1024.1024
    i32Number = Int32(f32Number) // ok: i32Number = 1024
    f32Number = 1024e10
    i32Number = Int32(f32Number) // throw an Exception
    f32Number = 3.4e40 // f32Number = POSITIVE_INFINITY
    i32Number = Int32(f32Number) // throw an Exception
    f32Number = 3.4e40 * 0.0 // f32Number = NaN
    i32Number = Int32(f32Number) // throw an Exception
    return 0
}

// 2.4 类型别名
type Point2D = (Float64, Float64)
type Point3D = (Float64, Float64, Float64)
let point1: Point2D = (0.5, 0.8)
let point2: Point3D = (0.5, 0.8, 1.1)

// 2.4.1 类型别名定义的规则
type Class1<V> = GenericClassA<Int64, V>

type Class3<V> = GenericClassC<Int64, V>
func foo<V> (p: Class3<V>) where V <: MyTrait { // add generic constraints when 'Class3<V>' is used
}
class ClassWithLongName<T> where T<:MyTrait {}
type Class<T> = ClassWithLongName<T> // Class<T> also has the constraint 'where T<:MyTrait'

type Int = Int32
let numOne: Int32 = 10
let numTwo: Int = 20
let numThree = numOne + numTwo
func add(left: Int, right: Int32): Int { left + right }

// 2.4.2 类型别名的使用
type A = B
class B {}
var a: A = B() // Use typealias A as type B

type A = B
class B {}
func foo() { A() } // Use type alias A as constructor of B

type A = B
class B {
    static var b : Int32 = 0;
    static func foo() {}
}

func foo() {
    A.foo() // Use A to access static method in class B
    A.b
}

enum TimeUnit {
    Day | Month | Year
}

type Time = TimeUnit
var a = Time.Day
var b = Time.Month // Use type alias Time to access constructors in TimeUnit