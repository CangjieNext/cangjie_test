/*
* Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

@interface A
@property int foo;
@end

@protocol P1
@property int foo;
@end

@protocol P2
@optional
@property int foo;
@end

@protocol P3
@property (readonly) int foo;
@end

@interface M1 : A <P1, P2, P3>
@end

@interface M2 <P1, P2, P3>
@end

@interface M3 : A <P3>
@end

@interface M4 : A <P3, P1, P2>
@end

@interface B
- (void)bar:(int)x;
@end

@protocol P4
- (void)bar:(int)x;
@end

@protocol P5
@optional
- (void)bar:(int)x;
@end

@interface M5 : B <P4, P5, P1>
@end

@interface M6 <P4, P5, P1>
@end

@interface M7 <P1, P5, P4>
@end

@protocol PP5 <P5>
@end

@protocol P6
@optional
- (void)bar:(int)x;
@end

@protocol PP6 <P6>
@end

@interface M8 <P4, PP5, PP6, P1>
@end