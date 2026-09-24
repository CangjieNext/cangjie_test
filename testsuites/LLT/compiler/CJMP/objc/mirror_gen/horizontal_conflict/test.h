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
@property int foo;
@end

@protocol P4
@property (readonly) int foo;
@end

@interface M1 : A <P1, P2, P3>
@end

@interface M2 <P1, P2, P3>
@end

@interface M3 <P2, P1, P3>
@end

@interface M4 : A <P3>
@end

@interface M5 <P1, P3, P2>
@end

@interface M6 : A <P4, P1, P2>
@end

@protocol P7
@end

@protocol P8
@end

@protocol P9
@end

@interface M7 : A <P7, P8, P9>
@end

@interface M8 <P7, P8, P9>
@end