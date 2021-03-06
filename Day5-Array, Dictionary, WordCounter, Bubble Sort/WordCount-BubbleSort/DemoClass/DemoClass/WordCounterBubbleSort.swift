//
//  WordCounter.swift
//  DemoClass
//
//  Created by techmaster on 9/9/14.
//  Copyright (c) 2014 Techmaster. All rights reserved.
//

import UIKit

class WordCounterBubbleSort: ConsoleScreen {
    
    var WordCountNSort: [Word] = [Word]()
    let dummyWords = ["", " ","a", "all", "an", "i", "in", "is", "it", "are", "were", "he", "she", "they", "it's", "my", "his", "her", "their", "this", "that", "very", "much"]
    
    let numrex = NSRegularExpression(pattern: "^\\d+$", options: NSRegularExpressionOptions.CaseInsensitive, error: nil)

    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*  if let plainString = self.readFileToString("data.txt") {
        self.countWord(plainString)
        }*/
        
        self.countWord("I like this. i hate that dog. Cat is fun,joke,love: is it cool?. dog,flower;dog. hate is bad hate.Love is all around. Red blue green yellow violet sexy")
        //self.countWord("aa nn mm cc kk ee cc bb bb ee dd aa")
        //self.countWord("cc kk cc")
    }
    
    func readFileToString(textFile: String) -> String? {
        let fileNameArr = textFile.componentsSeparatedByString(".")
        if fileNameArr.count != 2 { return nil }
        
        let filePath = NSBundle.mainBundle().pathForResource(fileNameArr[0], ofType: fileNameArr[1])
        println("\(filePath)")
        
//        return String.stringWithContentsOfFile(filePath!, encoding: NSUTF8StringEncoding, error: nil)
        return String(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding, error: nil)
    }
    func shouldRemoveThisWord(word: String) -> Bool {
        if contains(dummyWords, word) { return true }
        if (word =~ numrex!) { return true }
        return false;
    }
    
    func countWord(inputString: String) {
        let separator = NSMutableCharacterSet(charactersInString: " .,:;?!")
        let rawWordArray = inputString.lowercaseString.componentsSeparatedByCharactersInSet(separator)
        
        /* ok nhung khong sort duoc
        let wordSet = NSCountedSet()
        for word in rawWordArray {
        if !self.shouldRemoveThisWord(word) {
        wordSet.addObject(word)
        }
        }
        
        for word in wordSet {
        self.writeln("\(word) : \(wordSet.countForObject(word))")
        }*/
        
        for word in rawWordArray {
            if !self.shouldRemoveThisWord(word) {
                self.insertWordToWordCountNSort(word)
            }
        }
        
        for item in WordCountNSort {
            self.writeln("\(item.word) : \(item.count)")
        }
        
    }
    
    func insertWordToWordCountNSort(word: String) {
        var index = 0
        if (WordCountNSort.count == 0) {
            WordCountNSort.append(Word(word: word))
            return
        }
        
        for item in WordCountNSort {
            
            if (word == item.word) {
                item.increment()
                return
            } else {
                index++
                if (index == WordCountNSort.count) {
                    WordCountNSort.append(Word(word: word))
                }
            }
        }
        
        //Bubble Sort
        for var i = 0; i < WordCountNSort.count - 1; i++ {
            for var j = i + 1; j < WordCountNSort.count; j++ {

                if WordCountNSort[j].count > WordCountNSort[i].count {
                    let temp = WordCountNSort[i]
                    WordCountNSort[i] = WordCountNSort[j]
                    WordCountNSort[j] = temp
                }
            }
        }
        
        
//        WordCountNSort.sort {$0 > $1}
        
    }
    
}