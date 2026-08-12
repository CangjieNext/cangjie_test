/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package atomic_test

import (
	. "sync"
	. "sync/atomic"
	"testing"
	"unsafe"
)

var sinkk interface{}

func BenchmarkConcurrencyLoadInt32(b *testing.B) {
	var x int32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				LoadInt32(&x)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyLoadUInt32(b *testing.B) {
	var x uint32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				LoadUint32(&x)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyLoadInt64(b *testing.B) {
	var x int64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				LoadInt64(&x)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyLoadUInt64(b *testing.B) {
	var x uint64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				LoadUint64(&x)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyAtomicReferenceLoad(b *testing.B) {
	var x unsafe.Pointer
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				LoadPointer(&x)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyStoreInt32(b *testing.B) {
	var x int32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				StoreInt32(&x, 0)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyStoreUInt32(b *testing.B) {
	var x uint32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				StoreUint32(&x, 0)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyStoreInt64(b *testing.B) {
	var x int64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				StoreInt64(&x, 0)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyStoreUInt64(b *testing.B) {
	var x uint64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				StoreUint64(&x, 0)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyAtomicReferenceStore(b *testing.B) {
	var x unsafe.Pointer
	y := int32(1)
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				StorePointer(&x, unsafe.Pointer(&y))
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencySwapInt32(b *testing.B) {
	var x int32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				SwapInt32(&x, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencySwapUInt32(b *testing.B) {
	var x uint32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				SwapUint32(&x, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencySwapInt64(b *testing.B) {
	var x int64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				SwapInt64(&x, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencySwapUInt64(b *testing.B) {
	var x uint64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				SwapUint64(&x, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyAtomicReferenceSwap(b *testing.B) {
	u := int64(1)
	var x unsafe.Pointer = unsafe.Pointer(&u)
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			v := int64(1)
			var y unsafe.Pointer = unsafe.Pointer(&v)
			for j := 0; j < 10000; j++ {
				y = SwapPointer(&x, y)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyCasInt32(b *testing.B) {
	var x int32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				CompareAndSwapInt32(&x, 1, 0)
				CompareAndSwapInt32(&x, 0, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyCasUInt32(b *testing.B) {
	var x uint32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				CompareAndSwapUint32(&x, 1, 0)
				CompareAndSwapUint32(&x, 0, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyCasInt64(b *testing.B) {
	var x int64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				CompareAndSwapInt64(&x, 1, 0)
				CompareAndSwapInt64(&x, 0, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyCasUInt64(b *testing.B) {
	var x uint64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				CompareAndSwapUint64(&x, 1, 0)
				CompareAndSwapUint64(&x, 0, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyAtomicReferenceCas(b *testing.B) {
	u := int64(1)
	v := int64(1)
	w := int64(0)
	var x unsafe.Pointer = unsafe.Pointer(&u)
	var y unsafe.Pointer = unsafe.Pointer(&v)
	var z unsafe.Pointer = unsafe.Pointer(&w)
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				CompareAndSwapPointer(&x, y, z)
				CompareAndSwapPointer(&x, z, y)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyAddInt32(b *testing.B) {
	var x int32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				AddInt32(&x, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyAddUInt32(b *testing.B) {
	var x uint32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				AddUint32(&x, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyAddInt64(b *testing.B) {
	var x int64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				AddInt64(&x, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencyAddUInt64(b *testing.B) {
	var x uint64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				AddUint64(&x, 1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencySubInt32(b *testing.B) {
	var x int32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				AddInt32(&x, -1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencySubUInt32(b *testing.B) {
	var x uint32
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				AddUint32(&x, ^uint32(0))
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencySubInt64(b *testing.B) {
	var x int64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				AddInt64(&x, -1)
			}
			wg.Done()
		}()
	}
	wg.Wait()
}

func BenchmarkConcurrencySubUInt64(b *testing.B) {
	var x uint64
	sinkk = &x
	var wg WaitGroup
	wg.Add(b.N)
	for i := 0; i < b.N; i++ {
		go func() {
			for j := 0; j < 10000; j++ {
				AddUint64(&x, ^uint64(0))
			}
			wg.Done()
		}()
	}
	wg.Wait()
}
