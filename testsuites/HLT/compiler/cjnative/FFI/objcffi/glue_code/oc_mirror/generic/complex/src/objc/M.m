/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "M.h"
@implementation M
- (id)init{
self = [super init];
return self;
}
- (void)pFoo {
    printf("pFoo\n");
}
- (void)mFoo {
    printf("mFoo\n");
}
- (struct S*)mFoo1:(struct S*)p0 {
    printf("mFoo1");
    return p0;
}
- (NSObject<P> *)mFoo2:(NSObject<P> *)p0 {
    printf("mFoo2");
    return p0;
}
- (M*)mFoo3:(M*)p0 {
    printf("mFoo3");
    return p0;
}
- (id<P>)mFoo4:(id<P>)p0 {
    printf("mFoo4");
    return p0;
}
- (M**)mFoo5:(M**)p0 {
    printf("mFoo5");
    return p0;
}
@end

@implementation Animal

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age {
    self = [super init];
    if (self) {
        _name = [name copy];
        _age = age;
    }
    return self;
}

- (void)speak {
    NSLog(@"Animal sound");
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%ld years old)", self.name, self.age];
}

@end


@implementation Dog

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age breed:(NSString *)breed {
    self = [super initWithName:name age:age];
    if (self) {
        _breed = [breed copy];
    }
    return self;
}

- (void)speak {
    NSLog(@"Woof! I'm %@", self.name);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ - %@ (%ld years old)", self.breed, self.name, self.age];
}

@end

@implementation Cat

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age isIndoor:(BOOL)isIndoor {
    self = [super initWithName:name age:age];
    if (self) {
        _isIndoor = isIndoor;
    }
    return self;
}

- (void)speak {
    NSLog(@"Meow! I'm %@", self.name);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@ cat, %ld years old)", 
            self.name, self.isIndoor ? @"indoor" : @"outdoor", self.age];
}

@end


@implementation Person

- (instancetype)initWithName:(NSString *)name pet:(Animal *)pet {
    self = [super init];
    if (self) {
        _name = [name copy];
        _pet = pet;
    }
    return self;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ has pet: %@", self.name, self.pet];
}

@end

@implementation Stack {
    NSMutableArray *_array;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _array = [NSMutableArray array];
    }
    return self;
}

- (void)push:(id)object {
    [_array addObject:object];
}

- (id)pop {
    id lastObject = _array.lastObject;
    if (lastObject) {
        [_array removeLastObject];
    }
    return lastObject;
}

- (id)peek {
    return _array.lastObject;
}

- (BOOL)isEmpty {
    return _array.count == 0;
}

- (NSUInteger)count {
    return _array.count;
}

- (Stack *)map:(id (^)(id))transform {
    Stack *result = [[Stack alloc] init];
    for (id obj in [_array reverseObjectEnumerator]) {
        id transformed = transform(obj);
        if (transformed) {
            [result push:transformed];
        }
    }
    return result;
}

- (Stack *)filter:(BOOL (^)(id))predicate {
    Stack *result = [[Stack alloc] init];
    for (id obj in [_array reverseObjectEnumerator]) {
        if (predicate(obj)) {
            [result push:obj];
        }
    }
    return result;
}

@end

@implementation KeyValuePair

- (instancetype)initWithKey:(id)key value:(id)value {
    self = [super init];
    if (self) {
        _key = key;
        _value = value;
    }
    return self;
}

- (void)updateKey:(id)key whereKeyType:(id<NSCopying>)key {
    if ([key conformsToProtocol:@protocol(NSCopying)]) {
        self.key = key;
    }
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Key: %@, Value: %@", self.key, self.value];
}

@end

@implementation DataProcessor

- (instancetype)initWithData:(NSArray *)data {
    self = [super init];
    if (self) {
        _dataArray = [data copy];
    }
    return self;
}

- (NSArray<id> *)processWithTransformer:(id (^)(id))transformer {
    NSMutableArray *result = [NSMutableArray array];
    for (id obj in self.dataArray) {
        id transformed = transformer(obj);
        if (transformed) {
            [result addObject:transformed];
        }
    }
    return [result copy];
}

- (void)makeAllSpeakWhereT:(id<Speakable>)speakable {
    for (id obj in self.dataArray) {
        if ([obj conformsToProtocol:@protocol(Speakable)]) {
            [obj speak];
        }
    }
}

@end