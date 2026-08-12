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

import std.time.*
import std.collection.*
import std.random.*

class Timer {
    private var start_time: DateTime = DateTime.now()
    private var end_time: DateTime = DateTime.now()

    public init() {}

    public func start() {
        start_time = DateTime.now()
    }

    public func stop(): Duration {
        end_time = DateTime.now()
        end_time - start_time
    }
}

let timer = Timer()

open class Base {
    var baseNum: Int64 = 1
    public open func compute():Int64 {
        return this.baseNum
    }
    public init(num!: Int64){
        this.baseNum = num
    }
}

class DeriveDouble <: Base {
    
    init(num!: Int64){ super(num:num)}
    
    public override func compute() : Int64 {
        return this.baseNum * 2
    }
}

class DerivedTripple <: Base {
    
    init(num!: Int64){ super(num:num)}
    
    public override func compute() : Int64 {
        return this.baseNum * 3
    }
}


func Polymorphism() :Float64 {
    let count = 100000
    var result: Array<Int64> = Array<Int64>(count, repeat: 0)
    
    var result2: Array<Base> = Array<Base>(count, repeat:DeriveDouble(num: 0))
    var result3: Array<Base> = Array<Base>(count, repeat:DerivedTripple(num: 0))

    for (i in 0..count) {
        result[i] = i
        result2[i] = DeriveDouble(num: i)
        result3[i] = DerivedTripple(num: i)
    }
    timer.start()
    for (i in 0..count) {
        if (result[i] == i) {
            result2[i].baseNum = result2[i].compute();
            result3[i].baseNum = result3[i].compute();
        }
    }
    let time = timer.stop()
    var res = true
    for (i in 0..count) {
       if (result2[i].baseNum != i * 2 || result3[i].baseNum != i * 3) {
            res = false
       }
    }
    if (!res) {
        println("result is wrong")
    }
    println("Property Access - Polymorphism:\t${Float64(time.toNanoseconds())/1000000.0}\tms");
    return Float64(time.toMilliseconds())
}


class Square {
    var length: Int64 = 0
    var width: Int64 = 0
    
    init(length!: Int64, width!: Int64) {
        this.length = length
        this.width = width
    }
}

func GenerateFakeRandomSquare() :Array<Square> {
    return Array<Square>(10, repeat:Square(length: (Random().nextInt64(9)+1), width:(Random().nextInt64(9)+1)))
}

func SingleICClass() : Float64 {
    let container = GenerateFakeRandomSquare()
    let count = 1000000
    let arraySize: Int64 = 3
    var length_res = Array<Int64>(arraySize, repeat :0)
    var width_res = Array<Int64>(arraySize, repeat :0)
    timer.start()
    for (i in 0..count) {
        for (j in 0..container.size) {
            let thisBox = container[j]
            length_res[i % arraySize] += thisBox.length
            width_res[i % arraySize] += thisBox.width
        }
    }
    let time = timer.stop()
    var res = 0
    for (j in 0..arraySize) {
        res += length_res[j] + width_res[j]
    }
    println(res)
    println("Property Access - SingleICClass:\t${Float64(time.toNanoseconds())/1000000.0}\tms");
    return Float64(time.toMilliseconds())
}

// 不可扩展属性
open class Person {
    var name: String
    var age: Int64
    init(name!: String, age!: Int64) {
        this.name = name
        this.age = age
    }

    
    public func equal(cmp!: Person) : Bool {
        return this.name == cmp.name && this.age == cmp.age;
    }
}

class Student <: Person {
    var university: String
   
    init(name!: String, age!: Int64, university!: String) {
        super(name: name, age: age)
        this.university = university
    }
}

func GenerateFakeRandomPersons() : Array<Person> {
    let resource: Array<Person> = Array<Person>(3, repeat:Person(name: "John", age: (Random().nextInt64(49)+1)))
    return resource
}


func NoneExtension() : Float64 {
    let person1 = Person(name: "John", age: 12);
    let person2 = Person(name: "John", age: 13);
    let person3 = Person(name: "John", age: 14);
    let resourcesPerson: Array<Person> = [person1, person2, person3]
    let student1 = Student(name: "John", age: 21, university: "UNY")
    let count: Int64 = 100000
    let arraySize: Int64 = 3
    var test: Person = person1;
    var res: Array<Int64> = Array<Int64>(arraySize,repeat:0)
    timer.start()
    for (i in 0..count) {
     
        let a = resourcesPerson[i % arraySize];
        if (a.equal(cmp : person1)) {
            let b = resourcesPerson[(i + 1) % arraySize];
            if (b.equal(cmp: person2)) {
                let c = resourcesPerson[(i + 2) % arraySize];
                if (c.equal(cmp: person3)) {
                    test = c;
                }
            }
        }
        if (i % arraySize == 0 && test.equal(cmp: person3)) {
            res[i % 3] += 1
            test = person1
        }
        if (i % arraySize == 0 && test.equal(cmp: person1)) {
            res[i % 3] += 1
            test = person2
        }
    }
    let time = timer.stop()
    var sum = 0
    for (j in 0..arraySize) {
        sum += res[j]
    }
    println(sum)
    println("Property Access - NoneExtension:\t${Float64(time.toNanoseconds())/1000000.0}\tms");
    return Float64(time.toMilliseconds())
}


class MyObject {
    var num: Int64;
    var age: Int64;
    public prop Getter: Int64 {
        get (){
            return this.num;
        }
    }
    
    public mut prop Setter: Int64 {
         get() { return this.age }
         set(c) {this.age =c}
    }
    
    init(num!: Int64, age!: Int64) {
        this.num = num;
        this.age = age;
    }
}


func GenerateNumArray(count: Int64) : Array<Int64> {
    var numArray = Array<Int64>(count , repeat:0)
    for (i in 0..count) {
        numArray[i] = i + 1;
    }
    return numArray;
}


func GenerateResultArray(count: Int64): Array<MyObject> {
    var result: Array<MyObject> = Array<MyObject>(count, repeat:MyObject(num: 0, age: 1));
    for (i in 0..count) {
        result[i] = MyObject(num: i, age: i);
    }
    return result;
}

// Getter & Setter
func GetterSetterTest() : Array<MyObject> {
    let count = 10000000
    let result: Array<MyObject> = GenerateResultArray(10);
    let numArray: Array<Int64> = GenerateNumArray(10);
    timer.start()
    let resLen = result.size;
    for (i in 0..count) {
        let index = i % resLen;
        let ret = result[index];
        if (ret.Getter == numArray[index]) {
            ret.Setter = index;
        }
    }
    let time = timer.stop()
    println("Property Access - GetterSetterTest:\t${Float64(time.toNanoseconds())/1000000.0}\tms");
    return result
}

// All Number object
class Grades {
    var math: Float64
    var english: Float64
    var physics: Float64
    var chemistry: Float64
    
    init(math!: Float64, english!: Float64, physics!: Float64, chemistry!: Float64) {
        this.math = math
        this.english = english
        this.physics = physics
        this.chemistry = chemistry
    }
}

func GenerateFakeRandomGrades() : Array<Grades> {
    return Array<Grades>(10, repeat:Grades(math: (100.0*Random().nextFloat64()+1.0), english: (100.0*Random().nextFloat64()+1.0), physics: (100.0*Random().nextFloat64()+1.0), chemistry:(100.0*Random().nextFloat64()+1.0)))
}

func NumberObject() : Float64 {
    let count: Int64 = 1000000
    let arraySize: Int64 = 2
    let myGrades = GenerateFakeRandomGrades()
    var res = Array<Float64>((arraySize + 1), repeat:0.0)
    
    timer.start()
    let gradesLength = myGrades.size - 1;
    for (i in 0..count) {
        var ret = res[i & arraySize];
        var grades = myGrades[i & gradesLength];
        ret += grades.math
        ret += grades.english
        ret += grades.physics
        ret += grades.chemistry
        res[i & arraySize] = ret;
    }
    let time = timer.stop()
    var sum = 0.0
    for (j in 0..arraySize) {
        sum += res[j]
    }
    println(sum)
    println("Property Access - NumberObject:\t${Float64(time.toNanoseconds())/1000000.0}\tms");
    return Float64(time.toMilliseconds())
}

 main(){
    Polymorphism()
    SingleICClass()
    NoneExtension()

    let result = GetterSetterTest();
    let numArray =  GenerateNumArray(result.size);
    var sum = 0;
    var res = true;
    for (i in 0..result.size) {
        sum += result[i].num
        if (result[i].Setter != numArray[i]) {
            res = false;
            break;
        }    
    }
    println(res);
    println(sum);

    NumberObject()
    return 0
 }


