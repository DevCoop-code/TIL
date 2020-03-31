import Cocoa
import Foundation

let words = ["Cat", "Chicken", "fish", "Dog", "Mouse", "Guinea Pig", "monkey"]

typealias Entry = (Character, [String])

/*
 Old Way(Not Functional)
*/
func buildIndex(words: [String]) -> [Entry]
{
    var result = [Entry]()
    var letters = [Character]()
    
    for word in words
    {
        let firstLetter = Character(word.substring(to: word.index(word.startIndex, offsetBy: 1)).uppercased())
        if !letters.contains(firstLetter)
        {
            letters.append(firstLetter)
        }
    }
    
    for letter in letters
    {
        var wordsForLetter = [String]()
        for word in words
        {
             let firstLetter = Character(word.substring(to: word.index(word.startIndex, offsetBy: 1)).uppercased())
            
            if firstLetter == letter
            {
                wordsForLetter.append(word)
            }
        }
        result.append((letter, wordsForLetter))
    }
    return result
}
print(buildIndex(words: words))

/*
 Using Functional
 [Array's map]
 Creates a new array with the results of calls to the supplied closure for each element in the supplied array
 Usually Use map to perform transformations below the case map transforms an array of type [String] into an array of type [Character]
*/
func distinct<T: Equatable>(source: [T]) -> [T]
{
    var unique = [T]()
    for item in source
    {
        if !unique.contains(item)
        {
            unique.append(item)
        }
    }
    return unique
}

func buildIndex_f(words: [String]) -> [Entry]
{
    let letters = words.map { (word) -> Character in Character(word.substring(to: word.index(word.startIndex, offsetBy: 1)).uppercased()) }
    print(letters)
    
    let distinctLetters = distinct(source: letters)
    print(distinctLetters)
    
    return distinctLetters.map { (letter) -> Entry in return(letter, words.filter { (word) -> Bool in Character(word.substring(to: word.index(word.startIndex, offsetBy: 1)).uppercased()) == letter }) }
}
print(buildIndex_f(words: words))
