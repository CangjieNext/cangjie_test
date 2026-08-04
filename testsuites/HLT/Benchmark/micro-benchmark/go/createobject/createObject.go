/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package main

import (
	"fmt"
	"time"
)

type Object_8 struct {
	i1 int64
}

func NewObject_8(a int64) *Object_8 {
	return &Object_8{i1: a}
}

func (o *Object_8) Value() int64 {
	return o.i1
}

type Object_16 struct {
	i1, i2 int64
}

func NewObject_16(a, b int64) *Object_16 {
	return &Object_16{i1: a, i2: b}
}

func (o *Object_16) Value() int64 {
	return o.i1 + o.i2
}

type Object_32 struct {
	i1, i2, i3, i4 int64
}

func NewObject_32(a, b, c, d int64) *Object_32 {
	return &Object_32{
		i1: a, i2: b, i3: c, i4: d}
}

func (o *Object_32) Value() int64 {
	return o.i1 + o.i2 + o.i3 + o.i4
}

type Object_64 struct {
	i1, i2, i3, i4, i5, i6, i7, i8 int64
}

func NewObject_64(a, b, c, d, e, f, g, h int64) *Object_64 {
	return &Object_64{
		i1: a, i2: b, i3: c, i4: d, i5: e, i6: f, i7: g, i8: h}
}

func (o *Object_64) Value() int64 {
	return o.i1 + o.i2 + o.i3 + o.i4 + o.i5 + o.i6 + o.i7 + o.i8
}

type Object_128 struct {
	i1, i2, i3, i4, i5, i6, i7, i8 int64
	i9, i10, i11, i12, i13, i14, i15, i16 int64
}

func NewObject_128(a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p int64) *Object_128 {
	return &Object_128{
		i1:  a, i2: b, i3: c, i4: d, i5: e, i6: f, i7: g, i8: h,
		i9:  i, i10: j, i11: k, i12: l, i13: m, i14: n, i15: o, i16: p}
}

func (o *Object_128) Value() int64 {
	return o.i1 + o.i2 + o.i3 + o.i4 + o.i5 + o.i6 + o.i7 + o.i8 +
		o.i9 + o.i10 + o.i11 + o.i12 + o.i13 + o.i14 + o.i15 + o.i16
}

type Object_512 struct {
	i1, i2, i3, i4, i5, i6, i7, i8 int64
    i9, i10, i11, i12, i13, i14, i15, i16 int64
    i17, i18, i19, i20, i21, i22, i23, i24 int64
    i25, i26, i27, i28, i29, i30, i31, i32 int64
    i33, i34, i35, i36, i37, i38, i39, i40 int64
    i41, i42, i43, i44, i45, i46, i47, i48 int64
    i49, i50, i51, i52, i53, i54, i55, i56 int64
    i57, i58, i59, i60, i61, i62, i63, i64 int64
}

func NewObject_512( a,  b,  c,  d,  e,  f,  g,  h,
					a1,  b1,  c1,  d1,  e1,  f1,  g1,  h1,
					a2,  b2,  c2,  d2,  e2,  f2,  g2,  h2,
					a3,  b3,  c3,  d3,  e3,  f3,  g3,  h3,
					a4,  b4,  c4,  d4,  e4,  f4,  g4,  h4,
					a5,  b5,  c5,  d5,  e5,  f5,  g5,  h5,
					a6,  b6,  c6,  d6,  e6,  f6,  g6,  h6,
					a7,  b7,  c7,  d7,  e7,  f7,  g7,  h7 int64) *Object_512 {
	return &Object_512{
        i1: a, i2: b, i3: c, i4: d, i5: e, i6: f, i7: g, i8: h,
        i9: a1, i10: b1, i11: c1, i12: d1, i13: e1, i14: f1, i15: g1, i16: h1,
        i17: a2, i18: b2, i19: c2, i20: d2, i21: e2, i22: f2, i23: g2, i24: h2,
        i25: a3, i26: b3, i27: c3, i28: d3, i29: e3, i30: f3, i31: g3, i32: h3,
        i33: a4, i34: b4, i35: c4, i36: d4, i37: e4, i38: f4, i39: g4, i40: h4,
        i41: a5, i42: b5, i43: c5, i44: d5, i45: e5, i46: f5, i47: g5, i48: h5,
        i49: a6, i50: b6, i51: c6, i52: d6, i53: e6, i54: f6, i55: g6, i56: h6,
        i57: a7, i58: b7, i59: c7, i60: d7, i61: e7, i62: f7, i63: g7, i64: h7}
}

// Value 方法计算所有字段之和
func (o *Object_512) Value() int64 {
	return o.i1 + o.i2 + o.i3 + o.i4 + o.i5 + o.i6 + o.i7 + o.i8 + o.i9 + o.i10 + o.i11 + o.i12 + o.i13 +
		o.i14 + o.i15 + o.i16 + o.i17 + o.i18 + o.i19 + o.i20 + o.i21 + o.i22 + o.i23 + o.i24 + o.i25 +
		o.i26 + o.i27 + o.i28 + o.i29 + o.i30 + o.i31 + o.i32 + o.i33 + o.i34 + o.i35 + o.i36 + o.i37 +
		o.i38 + o.i39 + o.i40 + o.i41 + o.i42 + o.i43 + o.i44 + o.i45 + o.i46 + o.i47 + o.i48 + o.i49 +
		o.i50 + o.i51 + o.i52 + o.i53 + o.i54 + o.i55 + o.i56 + o.i57 + o.i58 + o.i59 + o.i60 + o.i61 +
		o.i62 + o.i63 + o.i64
}

func BenchmarkCreateObject_S8() {
	reps := 100000000
	object8s := make([]*Object_8, reps + 1)
	t1 := time.Now().UnixNano()
	for i := 0; i <= reps; i++ {
		object8s[i] = NewObject_8(int64(i))
	}
	t2 := time.Now().UnixNano()
	fmt.Printf("BenchmarkCreateObject_S8: %d ns/op\n", (t2 - t1)/int64(reps))
	fmt.Println(object8s[10].Value())
}

func BenchmarkCreateObject_S16() {
	reps := 100000000
	object16s := make([]*Object_16, reps + 1)
	t1 := time.Now().UnixNano()
	for i := 0; i <= reps; i++ {
		object16s[i] = NewObject_16(int64(i), int64(i))
	}
	t2 := time.Now().UnixNano()
	fmt.Printf("BenchmarkCreateObject_S16: %d ns/op\n", (t2 - t1)/int64(reps))
	fmt.Println(object16s[10].Value())
}

func BenchmarkCreateObject_S32() {
	reps := 100000000
	object32s := make([]*Object_32, reps + 1)
	t1 := time.Now().UnixNano()
	for i := 0; i <= reps; i++ {
		object32s[i] = NewObject_32(int64(i), int64(i), int64(i), int64(i))
	}
	t2 := time.Now().UnixNano()
	fmt.Printf("BenchmarkCreateObject_S32: %d ns/op\n", (t2 - t1)/int64(reps))
	fmt.Println(object32s[10].Value())
}

func BenchmarkCreateObject_S64() {
	reps := 100000000
	object64s := make([]*Object_64, reps + 1)
	t1 := time.Now().UnixNano()
	for i := 0; i <= reps; i++ {
		object64s[i] = NewObject_64(int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i))
	}
	t2 := time.Now().UnixNano()
	fmt.Printf("BenchmarkCreateObject_S64: %d ns/op\n", (t2 - t1)/int64(reps))
	fmt.Println(object64s[10].Value())
}

func BenchmarkCreateObject_S128() {
	reps := 100000000
	object128s := make([]*Object_128, reps + 1)
	t1 := time.Now().UnixNano()
	for i := 0; i <= reps; i++ {
		object128s[i] = NewObject_128(int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), 
									int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i))
	}
	t2 := time.Now().UnixNano()
	fmt.Printf("BenchmarkCreateObject_S128: %d ns/op\n", (t2 - t1)/int64(reps))
	fmt.Println(object128s[10].Value())
}

func BenchmarkCreateObject_S512() {
	reps := 100000000
	object512s := make([]*Object_512, reps + 1)
	t1 := time.Now().UnixNano()
	for i := 0; i <= reps; i++ {
		object512s[i] = NewObject_512(int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), 
									int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i),
									int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), 
									int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), 
									int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), 
									int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), 
									int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), 
									int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i), int64(i))
	}
	t2 := time.Now().UnixNano()
	fmt.Printf("BenchmarkCreateObject_S512: %d ns/op\n", (t2 - t1)/int64(reps))
	fmt.Println(object512s[10].Value())
}

func main() {
	BenchmarkCreateObject_S8()
	BenchmarkCreateObject_S16()
	BenchmarkCreateObject_S32()
	BenchmarkCreateObject_S64()
	BenchmarkCreateObject_S128()
	BenchmarkCreateObject_S512()
}