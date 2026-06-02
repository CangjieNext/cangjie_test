/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Assertion: Keywords

              INT8: 'Int8' ;
              INT16: 'Int16' ;
              INT32: 'Int32' ;
              INT64: 'Int64' ;
              INTNATIVE: 'IntNative' ;
              UINT8: 'UInt8' ;
              UINT16: 'UInt16' ;
              UINT32: 'UInt32' ;
              UINT64: 'UInt64' ;
              UINTNATIVE: 'UIntNative' ;
              FLOAT16: 'Float16' ;
              FLOAT32: 'Float32' ;
              FLOAT64: 'Float64' ;
              CHAR: 'Rune' ;
              BOOLEAN: 'Bool' ;
              UNIT: 'Unit' ;
              Nothing: 'Nothing' ;
              STRUCT: 'struct' ;
              ENUM: 'enum' ;
              THISTYPE: 'This';
              PACKAGE: 'package' ;
              IMPORT: 'import' ;
              CLASS: 'class' ;
              INTERFACE: 'interface' ;
              FUNC: 'func';
              MAIN: 'main';
              LET: 'let' ;
              VAR: 'var' ;
              TYPE_ALIAS: 'type' ;
              INIT: 'init' ;
              THIS: 'this' ;
              SUPER: 'super' ;
              IF: 'if' ;
              ELSE: 'else' ;
              CASE: 'case' ;
              TRY: 'try' ;
              CATCH: 'catch' ;
              FINALLY: 'finally' ;
              FOR: 'for' ;
              DO: 'do' ;
              WHILE: 'while' ;
              THROW: 'throw' ;
              RETURN: 'return' ;
              CONTINUE: 'continue' ;
              BREAK: 'break' ;
              IS: 'is' ;
              AS: 'as' ;
              IN: 'in' ;
              MATCH: 'match' ;
              FROM: 'from' ;
              WHERE: 'where';
              EXTEND: 'extend';
              SPAWN: 'spawn';
              SYNCHRONIZED: 'synchronized';
              MACRO: 'macro';
              QUOTE: 'quote';
              TRUE: 'true';
              FALSE: 'false';
              STATIC: 'static';
              PUBLIC: 'public' ;
              PRIVATE: 'private' ;
              PROTECTED: 'protected' ;
              OVERRIDE: 'override' ;
              REDEF: 'redef' ;
              ABSTRACT: 'abstract' ;
              OPEN: 'open' ;
              OPERATOR: 'operator' ;
              FOREIGN: 'foreign';
              INOUT: 'inout';
              PROP: 'prop';
              MUT: 'mut';
              UNSAFE: 'unsafe';
              GET: 'get';
              SET: 'set';

  @Description: Check that Int8 is a keyword.
  @Level:         1

  @Mode: compileonly

  @Negative: yes
*/

main() {
    var Int8 = 0
}

