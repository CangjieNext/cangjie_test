/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

#import "P.h"
#import <Foundation/Foundation.h>
struct S  {
int x;
int y;
};

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