/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package createobject;

class Object_8 {
    long i1;
    public Object_8(long a) {
        i1=a;
    }
    public long value() {
        return i1;
    }
}

class Object_16 {
    long i1; long i2;
    public Object_16(long a, long b) {
        i1=a;i2=b;
    }
    public long value() {
        return i1 + i2;
    }
}

class Object_32 {
    long i1; long i2;long i3; long i4;
    public Object_32(long a, long b, long c, long d) {
        i1=a;i2=b;i3=c;i4=d;
    }
    public long value() {
        return i1 + i2 + i3 + i4;
    }
}

class Object_64 {
    long i1; long i2;long i3; long i4;long i5; long i6;long i7; long i8;
    public Object_64(long a, long b, long c, long d, long e, long f, long g, long h) {
        i1=a;i2=b;i3=c;i4=d;i5=e;i6=f;i7=g;i8=h;
    }
    public long value() {
        return i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8;
    }
}

class Object_128 {
    long i1, i2, i3, i4, i5, i6, i7, i8;
    long i9, i10, i11, i12, i13, i14, i15, i16;

    public Object_128(long a, long b, long c, long d, long e, long f, long g, long h,
                      long a1, long b1, long c1, long d1, long e1, long f1, long g1, long h1) {
        i1=a;i2=b;i3=c;i4=d;i5=e;i6=f;i7=g;i8=h;
        i9=a1;i10=b1;i11=c1;i12=d1;i13=e1;i14=f1;i15=g1;i16=h1;
    }
    public long value() {
        return i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 +
                i11 + i12 + i13 + i14 + i15 + i16;
    }
}

class Object_512 {
    long i1, i2, i3, i4, i5, i6, i7, i8;
    long i9, i10, i11, i12, i13, i14, i15, i16;
    long i17, i18, i19, i20, i21, i22, i23, i24;
    long i25, i26, i27, i28, i29, i30, i31, i32;
    long i33, i34, i35, i36, i37, i38, i39, i40;
    long i41, i42, i43, i44, i45, i46, i47, i48;
    long i49, i50, i51, i52, i53, i54, i55, i56;
    long i57, i58, i59, i60, i61, i62, i63, i64;
    public Object_512(long a, long b, long c, long d, long e, long f, long g, long h,
                      long a1, long b1, long c1, long d1, long e1, long f1, long g1, long h1,
                      long a2, long b2, long c2, long d2, long e2, long f2, long g2, long h2,
                      long a3, long b3, long c3, long d3, long e3, long f3, long g3, long h3,
                      long a4, long b4, long c4, long d4, long e4, long f4, long g4, long h4,
                      long a5, long b5, long c5, long d5, long e5, long f5, long g5, long h5,
                      long a6, long b6, long c6, long d6, long e6, long f6, long g6, long h6,
                      long a7, long b7, long c7, long d7, long e7, long f7, long g7, long h7) {
        i1 = a; i2 = b; i3 = c; i4 = d; i5 = e; i6 = f; i7 = g; i8 = h;
        i9 = a1; i10 = b1; i11 = c1; i12 = d1; i13 = e1; i14 = f1; i15 = g1; i16 = h1;
        i17 = a2; i18 = b2; i19 = c2; i20 = d2; i21 = e2; i22 = f2; i23 = g2; i24 = h2;
        i25 = a3; i26 = b3; i27 = c3; i28 = d3; i29 = e3; i30 = f3; i31 = g3; i32 = h3;
        i33 = a4; i34 = b4; i35 = c4; i36 = d4; i37 = e4; i38 = f4; i39 = g4; i40 = h4;
        i41 = a5; i42 = b5; i43 = c5; i44 = d5; i45 = e5; i46 = f5; i47 = g5; i48 = h5;
        i49 = a6; i50 = b6; i51 = c6; i52 = d6; i53 = e6; i54 = f6; i55 = g6; i56 = h6;
        i57 = a7; i58 = b7; i59 = c7; i60 = d7; i61 = e7; i62 = f7; i63 = g7; i64 = h7;
    }
    public long value() {
        return i1 + i2 + i3 + i4 + i5 + i6 + i7 + i8 + i9 + i10 + i11 + i12 + i13 +
                i14 + i15 + i16 + i17 + i18 + i19 + i20 + i21 + i22 + i23 + i24 + i25 +
                i26 + i27 + i28 + i29 + i30 + i31 + i32 + i33 + i34 + i35 + i36 + i37 +
                i38 + i39 + i40 + i41 + i42 + i43 + i44 + i45 + i46 + i47 + i48 + i49 +
                i50 + i51 + i52 + i53 + i54 + i55 + i56 + i57 + i58 + i59 + i60 + i61 +
                i62 + i63 + i64;
    }
}

// 这里并没有找到比较适合 jmh 的写法 ，循环赋值结果会偏小
public class BenchmarkCreateObject {
    static void BenchmarkCreateObject_S8() {
        int reps = 100000000;
        Object_8[] object8s = new Object_8[reps + 1];
        long t1 = System.nanoTime();
        for (int i = 0; i <= reps; i ++) {
            object8s[i] = new Object_8(i);
        }
        long t2 = System.nanoTime();
        System.out.println("BenchmarkCreateObject_S8: " + (t2-t1)/reps + " ns/op");
        System.out.println(object8s[10].value());
    }

    static void BenchmarkCreateObject_S16() {
        int reps = 100000000;
        Object_16[] object16s = new Object_16[reps + 1];
        long t1 = System.nanoTime();
        for (int i = 0; i <= reps; i ++) {
            object16s[i] = new Object_16(i, i);
        }
        long t2 = System.nanoTime();
        System.out.println("BenchmarkCreateObject_S16: " + (t2-t1)/reps + " ns/op");
        System.out.println(object16s[10].value());
    }

    static void BenchmarkCreateObject_S32() {
        int reps = 100000000;
        Object_32[] object32s = new Object_32[reps + 1];
        long t1 = System.nanoTime();
        for (int i = 0; i <= reps; i ++) {
            object32s[i] = new Object_32(i, i, i, i);
        }
        long t2 = System.nanoTime();
        System.out.println("BenchmarkCreateObject_S32: " + (t2-t1)/reps + " ns/op");
        System.out.println(object32s[10].value());
    }

    static void BenchmarkCreateObject_S64() {
        int reps = 100000000;
        Object_64[] object64s = new Object_64[reps + 1];
        long t1 = System.nanoTime();
        for (int i = 0; i <= reps; i ++) {
            object64s[i] = new Object_64(i, i, i, i, i, i, i, i);
        }
        long t2 = System.nanoTime();
        System.out.println("BenchmarkCreateObject_S64: " + (t2-t1)/reps + " ns/op");
        System.out.println(object64s[10].value());
    }

    static void BenchmarkCreateObject_S128() {
        int reps = 10000000;
        Object_128[] object128s = new Object_128[reps + 1];
        long t1 = System.nanoTime();
        for (int i = 0; i <= reps; i ++) {
            object128s[i] = new Object_128(i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i);
        }
        long t2 = System.nanoTime();
        System.out.println("BenchmarkCreateObject_S128: " + (t2-t1)/reps + " ns/op");
        System.out.println(object128s[10].value());
    }

    static void BenchmarkCreateObject_S512() {
        int reps = 5000000;
        Object_512[] object512s = new Object_512[reps + 1];
        long t1 = System.nanoTime();
        for (int i = 0; i <= reps; i ++) {
            object512s[i] = new Object_512(i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i,
                    i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i, i);
        }
        long t2 = System.nanoTime();
        System.out.println("BenchmarkCreateObject_S512: " + (t2-t1)/reps + " ns/op");
        System.out.println(object512s[10].value());
    }

    public static void main(String[] args) {
        BenchmarkCreateObject_S8();
        BenchmarkCreateObject_S16();
        BenchmarkCreateObject_S32();
        BenchmarkCreateObject_S64();
        BenchmarkCreateObject_S128();
        BenchmarkCreateObject_S512();
    }
}
