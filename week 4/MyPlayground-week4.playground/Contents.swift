import UIKit

var greeting = "Thanks!!"

//Batch #22
//iOS Class_Remote Learning Assignment_Week 4

/* 2. There are several methods defined in the UITableViewDataSource protocol. Which methods are called by the system after we manually call reloadData() of a table view and what are their sequences? Please describe in as much detail as possible. 
 Ans:
 當執行reloadData()更新數據，以下是執行的順序和敘述：
 (1) numberOfSections(in:)：確定 TableView 數量等是否一致
 (2) tableView(_:numberOfRowsInSection:)：更新各 section 中TableView 的最新 Row 數據
 (3) tableView(_:cellForRowAt:)：更新每一行 UITableViewCell 的內容
 (4) tableView(_:titleForHeaderInSection:) 和 tableView(_:titleForFooterInSection:)：確認和更新 HeaderInSection、FooterInSection 兩區的設定和內容是否有變動
 */

//4. (Advanced) Please complete the following function that prints a pyramid made of asterisks.
func printPyramid(layers: Int) {
    
}

//For example, here’s what the output of printPyramid(layers: 5) should be:
/*
    *
   ***
  *****
 *******
*********
 */

/* 5. (Optional) Do you have any App ideas that you are interested in and want to develop? List them along with a brief description (2 sentences at most), and no need to consider the availability, required techniques and business models at all.
 (1) 各海岸資訊預測與安全評估
 想整合各政府和民間單位的即時觀測、預測資訊，讓民眾能透過app了解即將前往的海域現況如何（海底實況影像、漲退潮預測、浪況、天氣等）。
 (2) 需要即時科技解惑之平台
 想幫忙曾經在大眾運輸上看過各種因為不擅於手機操作而心情不好的高齡朋友們，透過大字體，和常使用的捷徑選項提供快速幫助（叫出相機、QRcode、去電常用聯絡人等），也想透過藍牙或是定位，讓app中需要幫助的使用者可以一鍵申請幫助，附近或是方便的下載app者可以透過電話/文字提供協助。
 */
