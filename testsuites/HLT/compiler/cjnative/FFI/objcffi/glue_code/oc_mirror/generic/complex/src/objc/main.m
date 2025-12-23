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

int main(int argc, char** argv) {
@autoreleasepool {
A* a= [[A alloc] init];
[a foo];
M* result = global_func(a);
[result pFoo];
}

return 0;
}
