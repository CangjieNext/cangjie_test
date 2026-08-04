/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package atomic_test

import (
	. "sync/atomic"
	"testing"
	"unsafe"
)

var sink interface{}

func BenchmarkAtomicLoadInt32(b *testing.B) {
	var x int32
	sink = &x
	for i := 0; i < b.N; i++ {
		_ = LoadInt32(&x)
	}
}

func BenchmarkAtomicLoadUInt32(b *testing.B) {
	var x uint32
	sink = &x
	for i := 0; i < b.N; i++ {
		_ = LoadUint32(&x)
	}
}

func BenchmarkAtomicLoadInt64(b *testing.B) {
	var x int64
	sink = &x
	for i := 0; i < b.N; i++ {
		_ = LoadInt64(&x)
	}
}

func BenchmarkAtomicLoadUInt64(b *testing.B) {
	var x uint64
	sink = &x
	for i := 0; i < b.N; i++ {
		_ = LoadUint64(&x)
	}
}

func BenchmarkAtomicLoadReference(b *testing.B) {
	var x unsafe.Pointer
	sink = &x
	for i := 0; i < b.N; i++ {
		_ = LoadPointer(&x)
	}
}

func BenchmarkAtomicStoreInt32(b *testing.B) {
	var x int32
	sink = &x
	for i := 0; i < b.N; i++ {
		StoreInt32(&x, 0)
	}
}

func BenchmarkAtomicStoreUInt32(b *testing.B) {
	var x uint32
	sink = &x
	for i := 0; i < b.N; i++ {
		StoreUint32(&x, 0)
	}
}

func BenchmarkAtomicStoreInt64(b *testing.B) {
	var x int64
	sink = &x
	for i := 0; i < b.N; i++ {
		StoreInt64(&x, 0)
	}
}

func BenchmarkAtomicStoreUInt64(b *testing.B) {
	var x uint64
	sink = &x
	for i := 0; i < b.N; i++ {
		StoreUint64(&x, 0)
	}
}

func BenchmarkAtomicStoreReference(b *testing.B) {
	var x unsafe.Pointer
	y := int32(1)
	sink = &x
	for i := 0; i < b.N; i++ {
		StorePointer(&x, unsafe.Pointer(&y))
	}
}

func BenchmarkAtomicSwapInt32(b *testing.B) {
	x := int32(1)
	y := int32(1)
	ptr := &x
	for i := 0; i < b.N; i++ {
		y = SwapInt32(ptr, y)
	}
}

func BenchmarkAtomicSwapUInt32(b *testing.B) {
	x := uint32(1)
	y := uint32(1)
	ptr := &x
	for i := 0; i < b.N; i++ {
		y = SwapUint32(ptr, y)
	}
}

func BenchmarkAtomicSwapInt64(b *testing.B) {
	x := int64(1)
	y := int64(1)
	ptr := &x
	for i := 0; i < b.N; i++ {
		y = SwapInt64(ptr, y)
	}
}

func BenchmarkAtomicSwapUInt64(b *testing.B) {
	x := uint64(1)
	y := uint64(1)
	ptr := &x
	for i := 0; i < b.N; i++ {
		y = SwapUint64(ptr, y)
	}
}

func BenchmarkAtomicSwapReference(b *testing.B) {
	u := int64(1)
	v := int64(1)
	var x unsafe.Pointer = unsafe.Pointer(&u)
	var y unsafe.Pointer = unsafe.Pointer(&v)
	sink = &x
	for i := 0; i < b.N; i++ {
		y = SwapPointer(&x, y)
	}
}

// TODO: need confirm the target of the case
func BenchmarkAtomicCompareAndSwapInt32(b *testing.B) {
	x := int32(1)
	ptr := &x
	for i := 0; i < b.N; i++ {
		CompareAndSwapInt32(ptr, 1, 0)
		CompareAndSwapInt32(ptr, 0, 1)
	}
}

func BenchmarkAtomicCompareAndSwapUInt32(b *testing.B) {
	x := uint32(1)
	ptr := &x
	for i := 0; i < b.N; i++ {
		CompareAndSwapUint32(ptr, 1, 0)
		CompareAndSwapUint32(ptr, 0, 1)
	}
}

func BenchmarkAtomicCompareAndSwapInt64(b *testing.B) {
	x := int64(1)
	ptr := &x
	for i := 0; i < b.N; i++ {
		CompareAndSwapInt64(ptr, 1, 0)
		CompareAndSwapInt64(ptr, 0, 1)
	}
}

func BenchmarkAtomicCompareAndSwapUInt64(b *testing.B) {
	x := uint64(1)
	ptr := &x
	for i := 0; i < b.N; i++ {
		CompareAndSwapUint64(ptr, 1, 0)
		CompareAndSwapUint64(ptr, 0, 1)
	}
}

func BenchmarkAtomicCompareAndSwapReference(b *testing.B) {
	u := int64(1)
	v := int64(1)
	w := int64(0)
	var x unsafe.Pointer = unsafe.Pointer(&u)
	var y unsafe.Pointer = unsafe.Pointer(&v)
	var z unsafe.Pointer = unsafe.Pointer(&w)
	sink = &x
	for i := 0; i < b.N; i++ {
		CompareAndSwapPointer(&x, y, z)
		CompareAndSwapPointer(&x, z, y)
	}
}

func BenchmarkAtomicAddInt32(b *testing.B) {
	var x int32
	ptr := &x
	for i := 0; i < b.N; i++ {
		AddInt32(ptr, 1)
	}
}

func BenchmarkAtomicAddUInt32(b *testing.B) {
	var x uint32
	ptr := &x
	for i := 0; i < b.N; i++ {
		AddUint32(ptr, 1)
	}
}

func BenchmarkAtomicAddInt64(b *testing.B) {
	var x int64
	ptr := &x
	for i := 0; i < b.N; i++ {
		AddInt64(ptr, 1)
	}
}

func BenchmarkAtomicAddUInt64(b *testing.B) {
	var x uint64
	ptr := &x
	for i := 0; i < b.N; i++ {
		AddUint64(ptr, 1)
	}
}


