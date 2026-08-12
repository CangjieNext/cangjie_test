/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


import std.collection.*

public class ParserOptions {

    var sourceType: ?String = Option<String>.Some("script")
    
    var sourceFilename: ?String = Option<String>.None

    var startLine: ?Int64 = Option<Int64>.Some(1)
    
    var allowReturnOutsideFunction: ?Bool = Option<Bool>.Some(false)
    
    var allowImportExportEverywhere: ?Bool = Option<Bool>.Some(false)
    
    var allowSuperOutsideMethod: ?Bool = Option<Bool>.Some(false)
    
    var plugins: ?ArrayList<String> = Option<ArrayList<String>>.Some(ArrayList<String>())
    
    var strictMode: ?Bool = Option<Bool>.None
    
    var ranges: ?Bool = Option<Bool>.Some(false)
    
}

private let defaultOptions = ParserOptions()

func getOptions(opts: ?ParserOptions): ParserOptions {
    let options: ParserOptions = ParserOptions()
    if(opts.isSome()) {
        if(opts.getOrThrow().sourceType.isSome()) {
            options.sourceType = opts.getOrThrow().sourceType
        }
        if(opts.getOrThrow().sourceFilename.isSome()) {
            options.sourceFilename = opts.getOrThrow().sourceFilename
        }
        if(opts.getOrThrow().startLine.isSome()) {
            options.startLine = opts.getOrThrow().startLine
        }
        if(opts.getOrThrow().allowReturnOutsideFunction.isSome()) {
            options.allowReturnOutsideFunction = opts.getOrThrow().allowReturnOutsideFunction
        }
        if(opts.getOrThrow().allowImportExportEverywhere.isSome()) {
            options.allowImportExportEverywhere = opts.getOrThrow().allowImportExportEverywhere
        }
        if(opts.getOrThrow().allowSuperOutsideMethod.isSome()) {
            options.allowSuperOutsideMethod = opts.getOrThrow().allowSuperOutsideMethod
        }
        if(opts.getOrThrow().plugins.isSome()) {
            options.plugins = opts.getOrThrow().plugins
        }
        if(opts.getOrThrow().strictMode.isSome()) {
            options.strictMode = opts.getOrThrow().strictMode
        }
        if(opts.getOrThrow().ranges.isSome()) {
            options.ranges = opts.getOrThrow().ranges
        }
    }
    return options
}


extend String {
    func subscript(index: Int64): Rune {
        return Rune(this[index])
    }
    
    func slice(start: Int64, end: Int64): String {
        return this[start..end]
    }
}
