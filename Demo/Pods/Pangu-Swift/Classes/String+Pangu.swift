//
//  String+Pangu.swift
//  Pangu-Swift
//
//  Created by X140Yu on 12/6/16.
//  Copyright © 2016 X140Yu. All rights reserved.
//

import Foundation

fileprivate var cjk_ans_regex: NSRegularExpression!
fileprivate var ans_cjk_regex: NSRegularExpression!
fileprivate var cjk_quote_regex: NSRegularExpression!
fileprivate var quote_cjk_regex: NSRegularExpression!
fileprivate var fix_quote_regex: NSRegularExpression!
fileprivate var cjk_bracket_cjk_regex: NSRegularExpression!
fileprivate var cjk_bracket_regex: NSRegularExpression!
fileprivate var bracket_cjk_regex: NSRegularExpression!
fileprivate var fix_bracket_regex: NSRegularExpression!
fileprivate var cjk_hash_regex: NSRegularExpression!
fileprivate var hash_cjk_regex: NSRegularExpression!

fileprivate let panguRegex: () = {
    let CJK = "([\\p{InHiragana}\\p{InKatakana}\\p{InBopomofo}\\p{InCJKCompatibilityIdeographs}\\p{InCJKUnifiedIdeographs}])"
    do {
        cjk_ans_regex = try NSRegularExpression(pattern: "\(CJK)([a-z0-9`~@\\$%\\^&\\*\\-_\\+=\\|\\\\/])", options: .caseInsensitive)

        ans_cjk_regex = try NSRegularExpression(pattern: "([a-z0-9`~!\\$%\\^&\\*\\-_\\+=\\|\\\\;:,\\./\\?])\(CJK)", options: .caseInsensitive)

        cjk_quote_regex = try NSRegularExpression(pattern: "([\"'])\(CJK)", options: .caseInsensitive)

        quote_cjk_regex = try NSRegularExpression(pattern: "\(CJK)([\"'])", options: .caseInsensitive)

        fix_quote_regex = try NSRegularExpression(pattern: "([\"'])(\\s*)(.+?)(\\s*)([\"'])", options: .caseInsensitive)

        cjk_bracket_cjk_regex = try NSRegularExpression(pattern: "\(CJK)([\\({\\[]+(.*?)[\\)}\\]]+)\(CJK)", options: .caseInsensitive)

        cjk_bracket_regex = try NSRegularExpression(pattern: "\(CJK)([\\(\\){}\\[\\]<>])", options: .caseInsensitive)

        bracket_cjk_regex = try NSRegularExpression(pattern: "\(CJK)([\\(\\){}\\[\\]<>])", options: .caseInsensitive)

        fix_bracket_regex = try NSRegularExpression(pattern: "([(\\({\\[)]+)(\\s*)(.+?)(\\s*)([\\)}\\]]+)", options: .caseInsensitive)

        cjk_hash_regex = try NSRegularExpression(pattern: "\(CJK)(#(\\S+))", options: .caseInsensitive)

        hash_cjk_regex = try NSRegularExpression(pattern: "((\\S+)#)\(CJK)", options: .caseInsensitive)
    } catch {

    }
}()

public extension String {

    func addSpacing() -> String {

        _ = panguRegex

        var result = self

        result = cjk_quote_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1 $2")

        result = quote_cjk_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1 $2")

        result = fix_quote_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1$3$5")

        let oldString = result
        result = cjk_bracket_cjk_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1 $2 $4")

        if oldString == result {
            result = cjk_bracket_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1 $2")

            result = bracket_cjk_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1 $2")
        }

        result = fix_bracket_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1$3$5")

        result = cjk_hash_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1 $2")

        result = hash_cjk_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1 $3")

        result = cjk_ans_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1 $2")

        result = ans_cjk_regex.stringByReplacingMatches(in: result, options: .reportProgress, range: NSMakeRange(0, result.characters.count), withTemplate: "$1 $2")

        return result
    }

}
