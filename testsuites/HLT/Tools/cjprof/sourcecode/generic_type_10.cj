/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.time.*
import std.collection.*

// ========== 正向引用链（10个不同泛型类型）==========
class Generic1<T> {
    var name: String
    var value: T
    var next: ?Generic2<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Generic2<T> {
    var name: String
    var value: T
    var next: ?Generic3<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Generic3<T> {
    var name: String
    var value: T
    var next: ?Generic4<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Generic4<T> {
    var name: String
    var value: T
    var next: ?Generic5<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Generic5<T> {
    var name: String
    var value: T
    var next: ?Generic6<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Generic6<T> {
    var name: String
    var value: T
    var next: ?Generic7<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Generic7<T> {
    var name: String
    var value: T
    var next: ?Generic8<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Generic8<T> {
    var name: String
    var value: T
    var next: ?Generic9<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Generic9<T> {
    var name: String
    var value: T
    var next: ?Generic10<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.next = None
    }
}

class Generic10<T> {
    var name: String
    var value: T
    var data: Array<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.value = value
        this.data = [value, value, value]
    }
}

// ========== 反向引用链（10个不同泛型类型）==========
class BackGeneric1<T> {
    var name: String
    var prev: ?BackGeneric2<T>
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackGeneric2<T> {
    var name: String
    var prev: ?BackGeneric3<T>
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackGeneric3<T> {
    var name: String
    var prev: ?BackGeneric4<T>
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackGeneric4<T> {
    var name: String
    var prev: ?BackGeneric5<T>
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackGeneric5<T> {
    var name: String
    var prev: ?BackGeneric6<T>
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackGeneric6<T> {
    var name: String
    var prev: ?BackGeneric7<T>
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackGeneric7<T> {
    var name: String
    var prev: ?BackGeneric8<T>
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackGeneric8<T> {
    var name: String
    var prev: ?BackGeneric9<T>
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackGeneric9<T> {
    var name: String
    var prev: ?BackGeneric10<T>
    
    public init(name: String) {
        this.name = name
        this.prev = None
    }
}

class BackGeneric10<T> {
    var name: String
    var data: Array<T>
    
    public init(name: String, value: T) {
        this.name = name
        this.data = [value, value, value]
    }
}

// ========== 多泛型参数混合引用链（10层）==========
class MixedGeneric1<T, U> {
    var name: String
    var value1: T
    var value2: U
    var next: ?MixedGeneric2<U, T>
    
    public init(name: String, value1: T, value2: U) {
        this.name = name
        this.value1 = value1
        this.value2 = value2
        this.next = None
    }
}

class MixedGeneric2<T, U> {
    var name: String
    var value1: T
    var value2: U
    var next: ?MixedGeneric3<U, T>
    
    public init(name: String, value1: T, value2: U) {
        this.name = name
        this.value1 = value1
        this.value2 = value2
        this.next = None
    }
}

class MixedGeneric3<T, U> {
    var name: String
    var value1: T
    var value2: U
    var next: ?MixedGeneric4<U, T>
    
    public init(name: String, value1: T, value2: U) {
        this.name = name
        this.value1 = value1
        this.value2 = value2
        this.next = None
    }
}

class MixedGeneric4<T, U> {
    var name: String
    var value1: T
    var value2: U
    var next: ?MixedGeneric5<U, T>
    
    public init(name: String, value1: T, value2: U) {
        this.name = name
        this.value1 = value1
        this.value2 = value2
        this.next = None
    }
}

class MixedGeneric5<T, U> {
    var name: String
    var value1: T
    var value2: U
    var next: ?MixedGeneric6<U, T>
    
    public init(name: String, value1: T, value2: U) {
        this.name = name
        this.value1 = value1
        this.value2 = value2
        this.next = None
    }
}

class MixedGeneric6<T, U> {
    var name: String
    var value1: T
    var value2: U
    var next: ?MixedGeneric7<U, T>
    
    public init(name: String, value1: T, value2: U) {
        this.name = name
        this.value1 = value1
        this.value2 = value2
        this.next = None
    }
}

class MixedGeneric7<T, U> {
    var name: String
    var value1: T
    var value2: U
    var next: ?MixedGeneric8<U, T>
    
    public init(name: String, value1: T, value2: U) {
        this.name = name
        this.value1 = value1
        this.value2 = value2
        this.next = None
    }
}

class MixedGeneric8<T, U> {
    var name: String
    var value1: T
    var value2: U
    var next: ?MixedGeneric9<U, T>
    
    public init(name: String, value1: T, value2: U) {
        this.name = name
        this.value1 = value1
        this.value2 = value2
        this.next = None
    }
}

class MixedGeneric9<T, U> {
    var name: String
    var value1: T
    var value2: U
    var next: ?MixedGeneric10<U, T>
    
    public init(name: String, value1: T, value2: U) {
        this.name = name
        this.value1 = value1
        this.value2 = value2
        this.next = None
    }
}

class MixedGeneric10<T, U> {
    var name: String
    var value1: T
    var value2: U
    var data: ArrayList<T>
    
    public init(name: String, value1: T, value2: U) {
        this.name = name
        this.value1 = value1
        this.value2 = value2
        this.data = ArrayList<T>()
        this.data.add(value1)
    }
}

main() {
    println("========== 10个不同泛型类型引用关系示例 ==========")
    println("")
    
    // 1. 创建正向引用链（10个不同泛型类型，Generic1<Int64> → Generic2<Int64> → ... → Generic10<Int64>）
    println("1. 创建正向引用链（10个不同泛型类型）...")
    let gen1 = Generic1<Int64>("Generic1", 1)
    let gen2 = Generic2<Int64>("Generic2", 2)
    let gen3 = Generic3<Int64>("Generic3", 3)
    let gen4 = Generic4<Int64>("Generic4", 4)
    let gen5 = Generic5<Int64>("Generic5", 5)
    let gen6 = Generic6<Int64>("Generic6", 6)
    let gen7 = Generic7<Int64>("Generic7", 7)
    let gen8 = Generic8<Int64>("Generic8", 8)
    let gen9 = Generic9<Int64>("Generic9", 9)
    let gen10 = Generic10<Int64>("Generic10", 10)
    
    gen1.next = Some(gen2)
    gen2.next = Some(gen3)
    gen3.next = Some(gen4)
    gen4.next = Some(gen5)
    gen5.next = Some(gen6)
    gen6.next = Some(gen7)
    gen7.next = Some(gen8)
    gen8.next = Some(gen9)
    gen9.next = Some(gen10)
    println("   正向引用链创建完成：Generic1<Int64> → Generic2<Int64> → ... → Generic10<Int64>")
    
    // 2. 创建反向引用链（10个不同泛型类型，BackGeneric1<Int64> ← BackGeneric2<Int64> ← ... ← BackGeneric10<Int64>）
    println("2. 创建反向引用链（10个不同泛型类型）...")
    let backGen1 = BackGeneric1<Int64>("BackGeneric1")
    let backGen2 = BackGeneric2<Int64>("BackGeneric2")
    let backGen3 = BackGeneric3<Int64>("BackGeneric3")
    let backGen4 = BackGeneric4<Int64>("BackGeneric4")
    let backGen5 = BackGeneric5<Int64>("BackGeneric5")
    let backGen6 = BackGeneric6<Int64>("BackGeneric6")
    let backGen7 = BackGeneric7<Int64>("BackGeneric7")
    let backGen8 = BackGeneric8<Int64>("BackGeneric8")
    let backGen9 = BackGeneric9<Int64>("BackGeneric9")
    let backGen10 = BackGeneric10<Int64>("BackGeneric10", 100)

    println("   反向引用链创建完成：BackGeneric10<Int64> → BackGeneric9<Int64> → ... → BackGeneric1<Int64>")
    
    // 3. 创建多泛型参数混合引用链（10层，类型交替）
    println("3. 创建多泛型参数混合引用链（10层，类型交替）...")
    let mixed1 = MixedGeneric1<Int64, String>("Mixed1", 1, "Value1")
    let mixed2 = MixedGeneric2<String, Int64>("Mixed2", "Value2", 2)
    let mixed3 = MixedGeneric3<Int64, String>("Mixed3", 3, "Value3")
    let mixed4 = MixedGeneric4<String, Int64>("Mixed4", "Value4", 4)
    let mixed5 = MixedGeneric5<Int64, String>("Mixed5", 5, "Value5")
    let mixed6 = MixedGeneric6<String, Int64>("Mixed6", "Value6", 6)
    let mixed7 = MixedGeneric7<Int64, String>("Mixed7", 7, "Value7")
    let mixed8 = MixedGeneric8<String, Int64>("Mixed8", "Value8", 8)
    let mixed9 = MixedGeneric9<Int64, String>("Mixed9", 9, "Value9")
    let mixed10 = MixedGeneric10<String, Int64>("Mixed10", "Value10", 10)
    
    mixed1.next = Some(mixed2)
    mixed2.next = Some(mixed3)
    mixed3.next = Some(mixed4)
    mixed4.next = Some(mixed5)
    mixed5.next = Some(mixed6)
    mixed6.next = Some(mixed7)
    mixed7.next = Some(mixed8)
    mixed8.next = Some(mixed9)
    mixed9.next = Some(mixed10)
    println("   多泛型参数混合引用链创建完成")
    
    // 4. 创建字符串类型的泛型引用链（10个不同类型）
    println("4. 创建字符串类型的泛型引用链（10个不同类型）...")
    let strGen1 = Generic1<String>("StrGeneric1", "Hello")
    let strGen2 = Generic2<String>("StrGeneric2", "World")
    let strGen3 = Generic3<String>("StrGeneric3", "Cangjie")
    let strGen4 = Generic4<String>("StrGeneric4", "Generic")
    let strGen5 = Generic5<String>("StrGeneric5", "Types")
    let strGen6 = Generic6<String>("StrGeneric6", "Reference")
    let strGen7 = Generic7<String>("StrGeneric7", "Chain")
    let strGen8 = Generic8<String>("StrGeneric8", "Example")
    let strGen9 = Generic9<String>("StrGeneric9", "Test")
    let strGen10 = Generic10<String>("StrGeneric10", "End")
    
    strGen1.next = Some(strGen2)
    strGen2.next = Some(strGen3)
    strGen3.next = Some(strGen4)
    strGen4.next = Some(strGen5)
    strGen5.next = Some(strGen6)
    strGen6.next = Some(strGen7)
    strGen7.next = Some(strGen8)
    strGen8.next = Some(strGen9)
    strGen9.next = Some(strGen10)
    println("   字符串类型泛型引用链创建完成")
    
    println("")
    println("========================================")
    println("所有泛型类型引用关系创建完成！")
    println("")
    println("导出堆内存：")
    println("")
    println("查看正向引用关系（10层不同泛型类型）：")
    println("  cjprof heap -i heap_generic_types.data --show-reference=\"Generic1<Int64>\" -D 10")
    println("")
    println("查看反向引用关系（10层不同泛型类型）：")
    println("  cjprof heap -i heap_generic_types.data --show-reference=\"BackGeneric10<Int64>\" --incoming-reference -D 10")
    println("")
    println("查看字符串类型引用关系（10层不同泛型类型）：")
    println("  cjprof heap -i heap_generic_types.data --show-reference=\"Generic1<String>\" -D 10")
    println("")
    println("查看多泛型参数引用关系（10层）：")
    println("  cjprof heap -i heap_generic_types.data --show-reference=\"MixedGeneric1<Int64,String>\" -D 10")
    println("========================================")
    println("")
    println("程序将在1分钟后自动退出，请在此之前导出堆内存...")
    sleep(Duration.second * 60)
    println("程序退出")
}