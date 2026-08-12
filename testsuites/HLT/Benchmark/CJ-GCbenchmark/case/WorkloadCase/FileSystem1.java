/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import java.util.*;
import java.util.concurrent.CompletableFuture;
import java.util.concurrent.ExecutionException;
import java.util.function.Supplier;
class GlobalScope {
    public static final int SEEDINIT = 49734321;
    public static final int TIME_CONVERSION = 1000;
    public static final int HEX_FFFFFFFF = 0xffffffff;
    public static final int HEX_FFFFFFF = 0xfffffff;
    public static final int HEX_7ED55D16 = 0x7ed55d16;
    public static final int HEX_C761C23C = 0xc761c23c;
    public static final int HEX_165667B1 = 0x165667b1;
    public static final int HEX_D3A2646C = 0xd3a2646c;
    public static final int HEX_FD7046C5 = 0xfd7046c5;
    public static final int HEX_B55A4F09= 0xb55a4f09;
    public static final int HEX_10000000 = 0x10000000;
    public static final int INT_12 = 12;
    public static final int INT_19 = 19;
    public static final int INT_5 = 5;
    public static final int INT_9 = 9;
    public static final int INT_3 = 3;
    public static final int INT_16 = 16;
    public static final int RANDOM_MULTIPLY = 128;
    public static final int RANDOM_ADD = 2056;
    public static final int RESULT_MULTIPLY = 255;
    public static final int ITEM_INDEX = 2;
    public static final int DIRS_ALL = 250;
    public static final int DIRS_SON = 8;
    public static final int FILES_COUNT = 5;
    public static final float DIR_RANDOM = 0.3f;
    public static final float FILE_RANDOM = 0.6f;
    public static final int FILE_DELETE_COUNT = 3;
    public static final int TEST_TIMES = 10;
    public static final boolean isDebug = false;
    public static int seedNum = SEEDINIT;
    public static void resetSeed() {
        seedNum = SEEDINIT;
    }
    public static Supplier<Double> random = () -> {
        // Robert Jenkins' 32 bit integer hash function.
        seedNum = (seedNum + HEX_7ED55D16 + (seedNum << INT_12)) & HEX_FFFFFFFF;
        seedNum = (seedNum ^ HEX_C761C23C ^ (seedNum >>> INT_19)) & HEX_FFFFFFFF;
        seedNum = (seedNum + HEX_165667B1 + (seedNum << INT_5)) & HEX_FFFFFFFF;
        seedNum = ((seedNum + HEX_D3A2646C) ^ (seedNum << INT_9)) & HEX_FFFFFFFF;
        seedNum = (seedNum + HEX_FD7046C5 + (seedNum << INT_3)) & HEX_FFFFFFFF;
        seedNum = (seedNum ^ HEX_B55A4F09 ^ (seedNum >>> INT_16)) & HEX_FFFFFFFF;
        return (double) (seedNum & HEX_FFFFFFF) / HEX_10000000;
    };

    public static int[] randomFileContents() {
        int bytes = ((int)(random.get() * RANDOM_MULTIPLY) >>> 0) + RANDOM_ADD;
        return randomFileContents(bytes);
    }
    public static int[] randomFileContents(int bytes) {
        int[] result = new int[bytes];
        for (int i = 0; i < bytes; i++) {
            result[i] = (int)(random.get() * RESULT_MULTIPLY) >>> 0;
        }
        return result;
    }
    public static CompletableFuture<Directory> setupDirectory() {
        return CompletableFuture.supplyAsync(() -> {
            Directory fs = new Directory();
            ArrayList<Directory> dirs = new ArrayList<>(List.of(fs));
            for (int index = 0; index < DIRS_ALL; index++) {
                Directory dir = dirs.get(index);
                for (int i = 0; i < DIRS_SON; ++i) {
                    if (dirs.size() < DIRS_ALL && random.get() >= DIR_RANDOM) {
                        dirs.add(dir.addDirectory("dir-"+i).join());
                    }
                }
            }
            for (Directory dir : dirs) {
                for (int i = 0; i < FILES_COUNT; ++i) {
                    if (random.get() >= FILE_RANDOM) {
                        dir.addFile("file-" + i, new File(randomFileContents()));
                    }
                }
            }
            return fs;
        });
    }

    public static CompletableFuture<Void> addLoop(Integer times) {
        return CompletableFuture.runAsync(() -> {
            long start = System.nanoTime();
            FileSystem1 ben = new FileSystem1();
            for(int i = 0; i < times; i++) {
                ben.runIteration().join();
            }
            long end = System.nanoTime();
            System.out.println("FileSystem1: ms = " + (double)(end - start) / 1000000.0);
        });
    }
    //以下是测试打印日志相关代码
	public static void printLog(String str) {
        System.out.println(str);
    }
}
class File{
    private int[] _data;
    File(int[] dataView) {
        this._data = dataView;
    }
    public int[] get_data(){
        return this._data;
    }
    public void set_data(int[] dataView){
        this._data = dataView;
    }
    public void swapByteOrder()  {
        for (int i = 0; i < this.get_data().length; i++) {
            this.get_data()[i] = this.get_data()[this.get_data().length - 1 - i];
        }
    }
}

class Directory{
    private Map<String,Object> structure;
    Directory(){
        this.structure = new HashMap<>();
    }
    public CompletableFuture<File> addFile(String name, File file) {
        return CompletableFuture.supplyAsync(() -> {
            Object entryFile = this.structure.get(name);
            if (entryFile != null) {
                if (entryFile instanceof File) {
                    throw new Error("Can't replace file with file;");
                }
                if (entryFile instanceof Directory) {
                    throw new Error("Can't replace a file with a new directory;");
                }
                throw new Error("Should not reach this code;");
            }
            this.structure.put(name, file);
            return file;
        });
    }
    public CompletableFuture<Directory> addDirectory(String name) {
        return CompletableFuture.supplyAsync(() -> {
            return addDirectory(name,new Directory());
        });
    }
    public Directory addDirectory(String name, Directory directory){
        Object entryFile = this.structure.get(name);
        if (entryFile != null) {
            if (entryFile instanceof File) {
                throw new Error("Can't replace file with directory;");
            }
            if (entryFile instanceof Directory) {
                throw new Error("Can't replace directory with new directory;");
            }
            throw new Error("Should not reach this code;");
        }
        this.structure.put(name, directory);
        return directory;
    }
    public CompletableFuture<ArrayList<DirectoryEntry>> ls() {
        return CompletableFuture.supplyAsync(() -> {
            ArrayList<DirectoryEntry> result =new ArrayList<>(List.of(new DirectoryEntry("",new Directory(),false)));
            result.remove(0);
            for (Map.Entry<String,Object> item : this.structure.entrySet()) {
                result.add(new DirectoryEntry(item.getKey(),item.getValue(),item.getValue() instanceof Directory));
            }
            return result;
        });
    }
    public CompletableFuture<ArrayList<DirectoryEntry>> forEachFile() {
        return CompletableFuture.supplyAsync(() -> {
            ArrayList<DirectoryEntry> result =new ArrayList<>(List.of(new DirectoryEntry("",new Directory(),false)));
            result.remove(0);
            for (DirectoryEntry item : this.ls().join()) {
                if (!item.isDirectory) { result.add(item); };
            }
            return result;
        });
    }
    public CompletableFuture<ArrayList<DirectoryEntry>> forEachFileRecursively() {
        return CompletableFuture.supplyAsync(() -> {
            ArrayList<DirectoryEntry> result =new ArrayList<>(List.of(new DirectoryEntry("",new Directory(),false)));
            result.remove(0);
            for (DirectoryEntry item : this.ls().join()) {
                if (item.isDirectory) {
                    for (DirectoryEntry file : ((Directory)item.entry).forEachFileRecursively().join()) {
                        result.add(file);
                    }
                } else {
                    result.add(item);
                }
            }
            return result;
        });
    }
    public CompletableFuture<ArrayList<DirectoryEntry>> forEachDirectoryRecursively() {
        return CompletableFuture.supplyAsync(() -> {
            ArrayList<DirectoryEntry> result =new ArrayList<>(List.of(new DirectoryEntry("",new Directory(),false)));
            result.remove(0);
            for (DirectoryEntry item : this.ls().join()) {
                if (!item.isDirectory) {
                    continue;
                }
                for (DirectoryEntry dirItem : ((Directory)item.entry).forEachDirectoryRecursively().join()) {
                    result.add(dirItem);
                }
                result.add(item);
            }
            return result;
        });
    }
    public CompletableFuture<Integer> fileCount() {
        return CompletableFuture.supplyAsync(() -> {
            int count = 0;
            for (DirectoryEntry item : this.ls().join()) {
                if (!item.isDirectory) { count += 1; }
            }
            return count;
        });
    }
    public CompletableFuture<Boolean> rm(String name) {
        return CompletableFuture.supplyAsync(() -> {
            return this.structure.remove(name) != null;
        });
    }
}

class DirectoryEntry {
    public String name;
    public Object entry;
    public boolean isDirectory;
    DirectoryEntry(String name, Object entry, boolean isDirectory) {
        this.name = name;
        this.entry = entry;
        this.isDirectory = isDirectory;
    }
}


/*
 * @State
 * @Tags Jetstream2
 */
class FileSystem1 {
    /*
     * @FileSystem1
     */
    public CompletableFuture<Void> runIteration() {
        return  CompletableFuture.runAsync(() -> {
            GlobalScope.resetSeed();
            Directory fs=  GlobalScope.setupDirectory().join();
            if(GlobalScope.isDebug) {
                ArrayList<DirectoryEntry> dirs = fs.forEachDirectoryRecursively().join();
                ArrayList<DirectoryEntry> files = fs.forEachFileRecursively().join();
				GlobalScope.printLog("根节点fs下所有dir的数量=====" + dirs.size());
                GlobalScope.printLog("根节点fs下所有dir下的file数量=====" + files.size());
            }
            for (DirectoryEntry file: fs.forEachFileRecursively().join()) {
                ((File)file.entry).swapByteOrder();
            }
            for(DirectoryEntry item: fs.forEachDirectoryRecursively().join()) {
                Directory dir = (Directory) item.entry;
                if(dir.fileCount().join() > GlobalScope.FILE_DELETE_COUNT) {
                    if(GlobalScope.isDebug) {
                        Integer deles = dir.fileCount().join();
						GlobalScope.printLog("");
                        GlobalScope.printLog("dir对象删除的file数量=====" + deles);
                    }
                    for(DirectoryEntry name: dir.forEachFile().join()) {
                        boolean result = dir.rm(name.name).join();
                        if(!result) {
                            throw new RuntimeException("rm should have returned true");
                        }
                    }
                }

            }
        });
    }


    public static void main(String[] args) throws ExecutionException, InterruptedException {
        GlobalScope.addLoop(GlobalScope.TEST_TIMES).get();
    }
}