/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "A.h"
#import "G.h"
#import <Foundation/Foundation.h>

void testGenerics() {
    NSLog(@"=== Objective-C 泛型特性演示 ===\n");
    
    // 1. 基础泛型集合
    NSLog(@"1. 基础泛型集合使用:");
    NSArray<Dog *> *dogs = @[
        [[Dog alloc] initWithName:@"Buddy" age:3 breed:@"Golden Retriever"],
        [[Dog alloc] initWithName:@"Max" age:5 breed:@"Labrador"]
    ];
    
    NSMutableDictionary<NSString *, Dog *> *dogDictionary = [NSMutableDictionary dictionary];
    dogDictionary[@"buddy"] = dogs[0];
    dogDictionary[@"max"] = dogs[1];
    
    // 编译器会进行类型检查
    Dog *firstDog = dogs[0]; // 正确：不需要类型转换
    // Cat *cat = dogs[0]; // 编译错误：类型不匹配
    
    // 2. 泛型栈类使用
    NSLog(@"\n2. 泛型栈类演示:");
    Stack<Dog *> *dogStack = [[Stack alloc] init];
    [dogStack push:dogs[0]];
    [dogStack push:dogs[1]];
    
    Dog *poppedDog = [dogStack pop]; // 正确类型
    NSLog(@"Popped dog: %@", poppedDog);
    
    // 3. 协变演示 (__covariant)
    NSLog(@"\n3. 协变特性演示:");
    Stack<Animal *> *animalStack = dogStack; // 协变：Dog[] 可以赋值给 Animal[]
    Animal *animal = [animalStack peek];
    NSLog(@"Animal from dog stack: %@", animal);
    
    // 4. 泛型方法使用
    NSLog(@"\n4. 泛型方法演示:");
    Stack<NSString *> *nameStack = [dogStack map:^NSString *(Dog *dog) {
        return [dog.name uppercaseString];
    }];
    
    while (![nameStack isEmpty]) {
        NSLog(@"Dog name: %@", [nameStack pop]);
    }
    
    // 5. 过滤演示
    NSLog(@"\n5. 过滤演示:");
    Stack<Dog *> *youngDogs = [dogStack filter:^BOOL(Dog *dog) {
        return dog.age < 4;
    }];
    NSLog(@"Young dogs count: %lu", (unsigned long)youngDogs.count);
    
    // 6. 键值对泛型
    NSLog(@"\n6. 键值对泛型演示:");
    KeyValuePair<NSString *, Dog *> *pair = [[KeyValuePair alloc] initWithKey:@"favorite" value:dogs[0]];
    NSLog(@"KeyValue pair: %@", pair);
    
    // 7. 泛型约束
    NSLog(@"\n7. 泛型约束演示:");
    DataProcessor<Animal *> *processor = [[DataProcessor alloc] initWithData:@[
        [[Dog alloc] initWithName:@"Rex" age:2 breed:@"German Shepherd"],
        [[Cat alloc] initWithName:@"Whiskers" age:1 isIndoor:YES]
    ]];
    
    [processor makeAllSpeakWhereT:(id<Speakable>)nil]; // 所有动物都会叫
    
    // 8. 复杂泛型嵌套
    NSLog(@"\n8. 复杂泛型嵌套:");
    NSDictionary<NSString *, NSArray<Person *> *> *peopleByCity = @{
        @"New York": @[
            [[Person alloc] initWithName:@"Alice" pet:dogs[0]],
            [[Person alloc] initWithName:@"Bob" pet:[[Cat alloc] initWithName:@"Fluffy" age:2 isIndoor:YES]]
        ]
    };
    
    for (NSString *city in peopleByCity) {
        NSLog(@"People in %@:", city);
        for (Person *person in peopleByCity[city]) {
            NSLog(@"  %@", person);
        }
    }
    
    // 9. 类型安全验证
    NSLog(@"\n9. 类型安全验证:");
    NSMutableArray<Animal *> *animals = [NSMutableArray array];
    [animals addObject:[[Dog alloc] initWithName:@"Spot" age:1 breed:@"Dalmatian"]];
    [animals addObject:[[Cat alloc] initWithName:@"Mittens" age:3 isIndoor:NO]];
    
    // 运行时类型检查
    for (Animal *animal in animals) {
        if ([animal isKindOfClass:[Dog class]]) {
            Dog *dog = (Dog *)animal;
            NSLog(@"Found dog: %@", dog.breed);
        } else if ([animal isKindOfClass:[Cat class]]) {
            Cat *cat = (Cat *)animal;
            NSLog(@"Found cat (indoor: %@)", cat.isIndoor ? @"YES" : @"NO");
        }
    }
}

void testBox() {
    NSLog(@"=== 简单的泛型示例 ===");
    // 1. 创建字符串盒子 - 类型安全！
    Box<NSString *> *stringBox = [[Box alloc] initWithContent:@"Hello, 泛型!"];
    NSString *stringContent = [stringBox getContent]; // 不需要类型转换
    NSLog(@"字符串内容: %@", stringContent);
    [stringBox printContentType];
    
    // 编译器会进行类型检查
    // NSNumber *wrongType = [stringBox getContent]; // 这行会报编译错误！
    
    // 2. 创建数字盒子
    Box<NSNumber *> *numberBox = [[Box alloc] initWithContent:@42];
    NSNumber *numberContent = [numberBox getContent]; // 直接获得 NSNumber 类型
    NSLog(@"数字内容: %@", numberContent);
    [numberBox printContentType];
    
    // 3. 创建数组盒子
    Box<NSArray<NSString *> *> *arrayBox = [[Box alloc] initWithContent:@[@"苹果", @"香蕉", @"橙子"]];
    NSArray<NSString *> *arrayContent = [arrayBox getContent];
    NSLog(@"数组内容: %@", arrayContent);
    [arrayBox printContentType];
    
    // 4. 泛型的优势：类型安全
    NSLog(@"\n=== 泛型的优势演示 ===");
    
    // 没有泛型的情况（老写法）
    Box *oldStyleBox = [[Box alloc] initWithContent:@"这是一个字符串"];
    NSString *content1 = (NSString *)[oldStyleBox getContent]; // 需要强制类型转换
    NSLog(@"老写法: %@", content1);
    
    // 有泛型的情况（新写法）
    Box<NSString *> *newStyleBox = [[Box alloc] initWithContent:@"这也是一个字符串"];
    NSString *content2 = [newStyleBox getContent]; // 不需要类型转换，编译器知道类型
    NSLog(@"新写法: %@", content2);
    
    // 5. 运行时类型检查
    NSLog(@"\n=== 运行时类型信息 ===");
    if ([stringBox.content isKindOfClass:[NSString class]]) {
        NSLog(@"stringBox 确实包含字符串");
    }
    
    // 6. 泛型方法调用更安全
    NSString *uppercase = [stringBox.content uppercaseString]; // 直接调用字符串方法
    NSLog(@"大写: %@", uppercase);
    
    // 如果是 numberBox.content，下面这行会编译警告/错误
    // NSString *errorExample = [numberBox.content uppercaseString]; // 编译错误！
}

int main(int argc, char** argv) {
    @autoreleasepool {
        testGenerics();
        A* a= [[A alloc] init];
        [a foo];
        [a testGenerics];
        M* result = global_func(a);
        [result pFoo];
        testBox();
    }
    return 0;
}
