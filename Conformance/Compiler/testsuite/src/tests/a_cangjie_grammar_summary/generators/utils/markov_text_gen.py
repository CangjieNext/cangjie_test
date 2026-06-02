# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.


from os.path import join, dirname
import random

def create_corpus() -> list:
    '''Create list of all words from the text'''
    text = open(join(dirname(__file__), 'spec14.txt'), encoding='utf-8').read()
    corpus = text.replace('. ',' ').split()
    return corpus

def make_pairs(corpus: list):
    '''Create pair of words for creating statistict of usage each word in the text'''
    for i in range(len(corpus)-1):
        yield (corpus[i], corpus[i+1])

def prepare_tree_dict() -> dict:
    '''Create tree in dict view'''
    corpus = create_corpus()
    pairs = make_pairs(corpus)
    word_dict = {}

    for word_1, word_2 in pairs:
        if word_1 in word_dict:
            word_dict[word_1].append(word_2)
        else:
            word_dict[word_1] = [word_2]
    return word_dict

def generate_text(init_word: str, num_words: int = 20) -> str:
    '''Ganerate random text with using inititial word'''
    word_dict = prepare_tree_dict()
    if init_word not in word_dict:
        return init_word
    chain = [init_word]

    for _ in range(num_words):
        chain.append(random.choice(word_dict[chain[-1]]))

    return ' '.join(chain)

def generate_random_text(num_words: int = 20) -> str:
    '''Ganerate random text without using inititial word'''
    word_dict = prepare_tree_dict()
    init_word = random.choice(list(word_dict.keys()))
    chain = [init_word]

    for _ in range(num_words):
        chain.append(random.choice(word_dict[chain[-1]]))

    return ' '.join(chain)
