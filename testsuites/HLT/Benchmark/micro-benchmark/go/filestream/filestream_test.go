/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package filestream_test

import (
	"bytes"
	"io/ioutil"
	"os"
	"strings"
	"testing"
	"io"
	"bufio"
)

func benchmarkWriteString(b *testing.B, count int) {
	s := strings.Repeat("1", count)
	filename := "temp.txt"
	file, err := os.Create(filename)
	os.Chmod(filename, 0777)
	if err != nil {
		b.Error(err)
		return
	}
	defer os.Remove(filename)
	defer file.Close()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := file.WriteString(s)
		if err != nil {
			b.Error(err)
			return
		}
		file.Seek(0, io.SeekStart)
	}
}

func BenchmarkWriteStringN64(b *testing.B) { benchmarkWriteString(b, 64) }
func BenchmarkWriteStringN512(b *testing.B) { benchmarkWriteString(b, 512) }
func BenchmarkWriteStringN4096(b *testing.B) { benchmarkWriteString(b, 4096) }
func BenchmarkWriteStringN32768(b *testing.B) { benchmarkWriteString(b, 32768) }
func BenchmarkWriteStringN262144(b *testing.B) { benchmarkWriteString(b, 262144) }
func BenchmarkWriteStringN2097152(b *testing.B) { benchmarkWriteString(b, 2097152) }
func BenchmarkWriteStringN16777216(b *testing.B) { benchmarkWriteString(b, 16777216) }

func benchmarkWriteArray(b *testing.B, count int) {
	data := bytes.Repeat([]byte{58}, count)
	filename := "temp.txt"
	file, err := os.Create(filename)
	os.Chmod(filename, 0777)
	if err != nil {
		b.Error(err)
		return
	}
	defer os.Remove(filename)
	defer file.Close()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err := file.WriteAt(data, 0)
		if err != nil {
			b.Error(err)
			return
		}
		file.Seek(0, io.SeekStart)
	}
}

func BenchmarkWriteArrayN64(b *testing.B) { benchmarkWriteArray(b, 64) }
func BenchmarkWriteArrayN512(b *testing.B) { benchmarkWriteArray(b, 512) }
func BenchmarkWriteArrayN4096(b *testing.B) { benchmarkWriteArray(b, 4096) }
func BenchmarkWriteArrayN32768(b *testing.B) { benchmarkWriteArray(b, 32768) }
func BenchmarkWriteArrayN262144(b *testing.B) { benchmarkWriteArray(b, 262144) }
func BenchmarkWriteArrayN2097152(b *testing.B) { benchmarkWriteArray(b, 2097152) }
func BenchmarkWriteArrayN16777216(b *testing.B) { benchmarkWriteArray(b, 16777216) }

func benchmarkBufferWriteArray(b *testing.B, size int, count int) {
	data := bytes.Repeat([]byte{58}, size)
	filename := "temp.txt"
	file,err := os.OpenFile(filename,os.O_WRONLY|os.O_CREATE,0666)
	if err != nil{
		b.Error(err)
		return
	}
	write := bufio.NewWriter(file)
	defer os.Remove(filename)
	defer file.Close()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		for j:=0; j < count; j++ {
			_, err := write.Write(data)
			if err != nil {
				b.Error(err)
				return
			}
		}
		write.Flush()
	}
}

func BenchmarkBufferWriteArrayN256(b *testing.B) { benchmarkBufferWriteArray(b, 256, 16) }
func BenchmarkBufferWriteArrayN512(b *testing.B) { benchmarkBufferWriteArray(b, 512, 8) }
func BenchmarkBufferWriteArrayN1024(b *testing.B) { benchmarkBufferWriteArray(b, 1024,4) }
func BenchmarkBufferWriteArrayN2048(b *testing.B) { benchmarkBufferWriteArray(b, 2048,2) }


func createFile(b *testing.B, filename string, count int) {
	file, err := os.Create(filename)
	if err != nil {
		b.Error(err)
		return
	}
	_, err = file.WriteString(strings.Repeat("1", count))
	if err != nil {
		b.Error(err)
		return
	}
	file.Close()
}

func benchmarkReadAllBytes(b *testing.B, count int) {
	filename := "temp.txt"
	createFile(b, filename, count)
	os.Chmod(filename, 0777)
	defer os.Remove(filename)
	file, err := os.Open(filename)
	if err != nil {
		b.Error(err)
		return
	}
	defer file.Close()
	b.ResetTimer()
	for i := 0; i < b.N; i++ {
		_, err = ioutil.ReadAll(file)
		if err != nil {
			b.Error(err)
			return
		}
		file.Seek(0, io.SeekStart)
	}
}

func BenchmarkReadAllBytesN64(b *testing.B) { benchmarkReadAllBytes(b, 64) }
func BenchmarkReadAllBytesN512(b *testing.B) { benchmarkReadAllBytes(b, 512) }
func BenchmarkReadAllBytesN4096(b *testing.B) { benchmarkReadAllBytes(b, 4096) }
func BenchmarkReadAllBytesN32768(b *testing.B) { benchmarkReadAllBytes(b, 32768) }
func BenchmarkReadAllBytesN262144(b *testing.B) { benchmarkReadAllBytes(b, 262144) }
func BenchmarkReadAllBytesN2097152(b *testing.B) { benchmarkReadAllBytes(b, 2097152) }
func BenchmarkReadAllBytesN16777216(b *testing.B) { benchmarkReadAllBytes(b, 16777216) }

func benchmarkBufferRead(b *testing.B, size int) {
	b.StopTimer()
	bufferSize := 4096
	flushTimes := bufferSize / size
	filename := "temp.txt"
	createFile(b, filename, bufferSize)
	os.Chmod(filename, 0777)
	defer os.Remove(filename)
	file, err := os.Open(filename)
	if err != nil {
		b.Error(err)
		return
	}
	defer file.Close()
	data := make([]byte, size)
	reader := bufio.NewReader(file)
	b.StartTimer()
	for i := 0; i < b.N; i++ {
		for j:=0; j < flushTimes; j++ {
			_, err := reader.Read(data)
			if err != nil {
				b.Error(err)
				return
			}
		}
		file.Seek(0, io.SeekStart)
	}
}

func BenchmarkBufferReadN256(b *testing.B) { benchmarkBufferRead(b, 256) }
func BenchmarkBufferReadN512(b *testing.B) { benchmarkBufferRead(b, 512) }
func BenchmarkBufferReadN1024(b *testing.B) { benchmarkBufferRead(b, 1024) }
func BenchmarkBufferReadN2048(b *testing.B) { benchmarkBufferRead(b, 2048) }
