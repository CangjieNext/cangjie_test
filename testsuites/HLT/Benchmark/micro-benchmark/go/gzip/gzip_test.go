/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package gzip_test

import (
	"compress/gzip"
	"math/rand"
	"os"
	"testing"
)
func benchmarkGzipCompress(b *testing.B, fn func(gzipWiter *gzip.Writer)error) {
	filename := "temp.gzip"
	file, err := os.Create(filename)
	if err != nil {
		b.Error(err)
		return
	}
	defer file.Close()
	gzipWiter := gzip.NewWriter(file)
	gzipWiter.Header.Name = file.Name()
	defer gzipWiter.Close()

	err = fn(gzipWiter)
	if err != nil {
		b.Error(err)
		return
	}
}

func benchmarkGzipUncompress(b *testing.B, fn func(gzipReader *gzip.Reader)error) {
	filename := "temp.gzip"
	file, err := os.Open(filename)
	if err != nil {
		b.Error(err)
		return
	}
	defer file.Close()
	gzipReader, err := gzip.NewReader(file)
	if err != nil {
		b.Error(err)
		return
	}
	defer gzipReader.Close()
	defer os.Remove(filename)
	err = fn(gzipReader)
	if err != nil {
		b.Error(err)
		return
	}
}

func benchmarkUncompress(b *testing.B, count int) {
	bufWrite := make([]byte, count)
	for i := range bufWrite {
		bufWrite[i]= byte(rand.Intn(10))
	}
	benchmarkGzipCompress(b, func(gzipWiter *gzip.Writer) error {
		_, err := gzipWiter.Write(bufWrite)
		if  err != nil {
			return err
		}
		return nil
	})
	b.ResetTimer()
	bufRead := make([]byte, count)

	benchmarkGzipUncompress(b, func(gzipReader *gzip.Reader) error {
		size, err := gzipReader.Read(bufRead)
		if  size != count {
			return err
		}
		return nil
	})
}

func benchmarkCompress(b *testing.B, count int) {
	bufWrite := make([]byte, count)
	for i := range bufWrite {
		bufWrite[i]= byte(rand.Intn(10))
	}
	b.ResetTimer()
	benchmarkGzipCompress(b, func(gzipWiter *gzip.Writer) error {
		_, err := gzipWiter.Write(bufWrite)
		if  err != nil {
			return err
		}
		return nil
	})
}

func BenchmarkCompress_64(b *testing.B) { benchmarkCompress(b, 64) }
func BenchmarkCompress_256(b *testing.B) { benchmarkCompress(b, 256) }
func BenchmarkCompress_2k(b *testing.B) { benchmarkCompress(b, 2*1024) }
func BenchmarkCompress_16k(b *testing.B) { benchmarkCompress(b, 16*1024) }
func BenchmarkCompress_128k(b *testing.B) { benchmarkCompress(b, 128*1024) }
func BenchmarkCompress_1M(b *testing.B) { benchmarkCompress(b, 1024*1024) }
func BenchmarkCompress_8M(b *testing.B) { benchmarkCompress(b, 8*1024*1024) }
func BenchmarkCompress_64M(b *testing.B) { benchmarkCompress(b, 64*1024*1024) }
func BenchmarkCompress_512M(b *testing.B) { benchmarkCompress(b, 512*1024*1024) }



func BenchmarkUnCompress_64(b *testing.B) { benchmarkUncompress(b, 64) }
func BenchmarkUnCompress_256(b *testing.B) { benchmarkUncompress(b, 256) }
func BenchmarkUnCompress_2k(b *testing.B) { benchmarkUncompress(b, 2*1024) }
func BenchmarkUnCompress_16k(b *testing.B) { benchmarkUncompress(b, 16*1024) }
func BenchmarkUnCompress_128k(b *testing.B) { benchmarkUncompress(b, 128*1024) }
func BenchmarkUnCompress_1M(b *testing.B) { benchmarkUncompress(b, 1024*1024) }
func BenchmarkUnCompress_8M(b *testing.B) { benchmarkUncompress(b, 8*1024*1024) }
func BenchmarkUnCompress_64M(b *testing.B) { benchmarkUncompress(b, 64*1024*1024) }

