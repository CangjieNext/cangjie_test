/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "P.h"
#import <Foundation/Foundation.h>
#import <stddef.h>
struct S  {
int x;
int y;
};

@interface Box<ObjectType> : NSObject

@property (nonatomic, strong) ObjectType content;

- (instancetype)initWithContent:(ObjectType)content;
- (ObjectType)getContent;
- (void)printContentType;

@end

@interface M :NSObject <P> {
    struct S* v0;
    NSObject<P> *v1;
    M* v2;
    id<P> v3;
}
- (id)init;
- (void)mFoo;
- (struct S*)mFoo1:(struct S*)p0;
- (NSObject<P> *)mFoo2:(NSObject<P> *)p0;
- (M*)mFoo3:(M*)p0;
- (id<P>)mFoo4:(id<P>)p0;
- (M**)mFoo5:(M**)p0;
- (void)testBox:(id)b;

@property (nonatomic, readwrite) struct S* p0;
@property (nonatomic, readwrite) NSObject<P> * p1;
@property (nonatomic, readwrite) M* p2;
@property (nonatomic, readwrite) id<P> p3;
@end

@protocol Speakable <NSObject>
- (void)speak;
@end

@interface Animal : NSObject <Speakable>
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age;
@end

@interface Dog : Animal
@property (nonatomic, assign) NSString *breed;
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age breed:(NSString *)breed;
@end

@interface Cat : Animal
@property (nonatomic, assign) BOOL isIndoor;
- (instancetype)initWithName:(NSString *)name age:(NSInteger)age isIndoor:(BOOL)isIndoor;
@end

@interface Person : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) Animal *pet;
- (instancetype)initWithName:(NSString *)name pet:(Animal *)pet;
@end

// 泛型栈类
@interface Stack<__covariant ObjectType> : NSObject

- (void)push:(ObjectType)object;
- (ObjectType)pop;
- (ObjectType)peek;
- (BOOL)isEmpty;
- (NSUInteger)count;

// 泛型方法：转换栈中所有元素
- (Stack *)map:(id (^)(ObjectType obj))transform;
// 泛型方法：过滤
- (Stack *)filter:(BOOL (^)(ObjectType obj))predicate;

@end

// 泛型键值对容器
@interface KeyValuePair<__contravariant KeyType, __covariant ValueType> : NSObject

@property (nonatomic, strong) KeyType key;
@property (nonatomic, strong) ValueType value;

- (instancetype)initWithKey:(KeyType)key value:(ValueType)value;

// 约束泛型方法：KeyType 必须遵循 NSCopying
- (void)updateKey:(id)newKey;

@end

// 泛型数据处理类
@interface DataProcessor<__covariant T> : NSObject

@property (nonatomic, strong) NSArray<T> *dataArray;

- (instancetype)initWithData:(NSArray<T> *)data;

// 处理数据并返回指定类型
- (NSArray<id> *)processWithTransformer:(id (^)(T obj))transformer;

// 约束泛型：T 必须遵循 Speakable 协议
- (void)makeAllSpeakWhereT:(id<Speakable>)speakable;

@end

