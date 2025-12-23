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

#import "Dog.h"

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