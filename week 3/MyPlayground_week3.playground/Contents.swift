import UIKit

var greeting = "THANK YOU"

//Batch #22 / iOS Class
//Remote Learning Assignment - Week 3
// 1. What is a closure ? How to execute a closure?
/* 回覆
 closure 跟 func 都很常會被拿來使用，藉以表述、定義某個參數。
 不同的是，closure 在使用上不需要特別為其涵括的參數命名，即可使用；而且每次叫出使用，它可以紀錄、繼續傳送更新後的參數。
 常見的使用方式有 Callback Function、Sorting、Filtering 等。
 在 closure 中參數可使用 $0、$1、$2 等符號代稱第一個參數、第二個參數、第三個參數。
 */

/* 2. Please declare a closure whose input type is Int, output type is Bool. The functionality of
this closure is to verify if the input is odd or not. Return true if it’s odd and vice versa. */
//回覆
let isOdd: (Int) -> Bool = { number in
    return number % 2 != 0
}

let result = isOdd(5)
//得到 true，代表公式足夠判斷是否為奇數

/* 3. Please complete the following function that prints a triangle made of asterisks.
 func printTriangle(layers: Int) {
 // TODO: print a triangle
 }
 For example, here’s what the output of printTraingle(layers: 5) should be:
 *
 **
 ***
 ****
 *****
 */

//回覆
func printTriangle(layers: Int) {
    for i in 1...layers {
        
        for _ in 1...i {
            print("*", terminator: "")
        }
        print()
    }
}
//測試看看
printTriangle(layers: 5)
//成功
