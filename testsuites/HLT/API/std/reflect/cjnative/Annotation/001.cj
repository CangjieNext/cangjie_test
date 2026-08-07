/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: ../MyType
// EXEC: %compiler %cmp_opt %compile_library --module-name=MyType ./MyType/src/myType/*.cj -o libMyType.myType.%library_suffix
// EXEC: %compiler %cmp_opt -o %output %f -L. -lMyType.myType %cmp_utest_opt
// RUN-EXEC: %run %run_opt %output %run_utest_opt %run_args

import std.reflect.*
import MyType.myType.*

@Annotation
public class Annotation1 {
    public let data: String
    public const init() {
        this.data = "empty"
    }
    public const init(data: String) {
        this.data = data
    }
}

@Annotation1
public class Foo {}

@Annotation1["name_bar"]
public class Bar {}

@Test
class Test {
    @TestCase
    func test0(): Unit {
        var obj = Foo()
        @Expect(TypeInfo.of(obj).annotations.size, 1)
        @Expect((TypeInfo.of(obj).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().data, "empty")
    }
    @TestCase
    func test1(): Unit {
        var obj2 = Bar()
        @Expect(TypeInfo.of(obj2).annotations.size, 1)
        @Expect((TypeInfo.of(obj2).findAnnotation<Annotation1>().getOrThrow() as Annotation1).getOrThrow().data, "name_bar")
    }
}
幂等性cap

所有的组合优于继承

interface 可以读取文件 {
    public func readFile(): String
}

interface 可以发送邮件 {
    public func sendEmail(): Unit
}

class 办公桌 <: 可以读取文件 & 可以发送邮件 {
    class 显示屏
    class 主机
    class 鼠标
    class 键盘
    public func readFile(): String {
        主机.开机()
        主机.读()
    }
    public func sendEmail(): Unit {
        主机.开机()
        主机.发送()
    }
}

幂等性，传递性，偏序性，交换律 behavior

interface IsEnumerable {
    public func getEnumerations(): Array<String>
    public func selfCheck(): Unit {
        
    }
}

func SpecCompiler.compile(c: Capability) {
    match (c) {
        case e: IsEnumerable => let enums = e.getEnumerations()
        case _ => ...
    }
}

test_model

std.convert

摊平
class DigestAlgoCap <: Capability & IsEnumerable {
    let enumCap = EnumCap()
    public func getEnumerations(): Array<String> {
        enumCap
        [xxx, xxxx]
    }
}

ECS Entity Component System

组合思想，使得概念系统易于表达，且易于拓展

class EnumCap PhaseCap

cap 通用  cap1 cap2 cap3
behavior

继承与组合

trait 属性

cap 不一定是class，也可能是interface
TypeSpec

remove clear

为什么需要有这样复杂的cap结构？原因是：我们最后要实现 SpecCompiler

criterion


ArrayList reverse APISpec  ArrayListReverseCap <: 幂等性Cap {
    
}
std.collection HashMap   APISpec   cap4 <: cap1  cap5 {
    cap2
    cap3
}
std.collection.concurrent  ConcurrentHashMap APISpec   cap4 <: cap1  cap5 {
    cap2
    cap3
}
std.math APISpec   cap4 <: cap1  cap5 {
    cap2
    cap3
}

人机交互
我们首先有一个cjpm工程，然后当AI需要人工确认的时候，就会直接更新cjpm工程，这个cjpm工程本身就是问卷，问卷以代码形式呈现，你直接编辑代码来完成填空，编译运行cjpm工程，输出信息，信息给AI，AI继续操作。
好处：代码自带类型检查，且运行后自带有效性检查，可以让人不犯错。代码运行获得确定性信息给AI。

代码的表结构，然后你填表，直接用cjss来编写

我们需要提供一个足够完善的API系统来让AI组织语言词汇来构造代码的问卷，然后人可以通过编码的方式来提供确定性的回复。这个确定性的回复的关键价值在于，不会跟AI打哈哈，代码运行时提前就会拦截不合理的地方。

任何的表达，任何的逻辑推导，一定是确定性的，不能是生成式的。

range
SPEC： start 是 Integer  end 是 Integer ，但我们例子只考虑 0, 1, 2  ；你的潜台词是，012足够描述用户使用场景，所以我们在spec层只选取了012；

// 首先描述start一定是Integer
start is Integer
end is Integer

通过等价类测试方法论来给出start和end的代表性取值[0, 1, 2]

MODEL层直接引用SPEC层给出的结论[0, 1, 2]

// SPEC给出要求，MODEL层照办
// 但是我们只要求测试012就够了，所以MODEL你看着办
start in [0, 1, 2]
end in [0, 1, 2]

如何看待资料中的示例代码？
- 理论上示例代码与自然语言描述的比例之和为 100% 。你没有自然语言描述，但是示例代码管饱，那也没问题。