//
//  main.swift
//  Pangu-Swift
//
//  Created by X140Yu on 12/6/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Foundation

let result1 = "Mr.龍島主道：「Let's Party!各位高明博雅君子！」".addSpacing()
let expected1 = "Mr. 龍島主道：「Let's Party! 各位高明博雅君子！」"

let result2 = "Sephiroth見他這等神情,也是悚然一驚:不知我這Ultimate Destructive Magic是否對付得了?".addSpacing()
let expected2 = "Sephiroth 見他這等神情, 也是悚然一驚: 不知我這 Ultimate Destructive Magic 是否對付得了?"

let result3 = "請問Jackie的鼻子有幾個？123個！".addSpacing()
let expected3 = "請問 Jackie 的鼻子有幾個？123 個！"

let result4 = "新八的構造成分有95%是眼鏡、3%是水、2%是垃圾".addSpacing()
let expected4 = "新八的構造成分有 95% 是眼鏡、3% 是水、2% 是垃圾"

assert(result1 == expected1)
assert(result2 == expected2)
assert(result3 == expected3)
assert(result4 == expected4)


debugPrint("All tests are passed!")
