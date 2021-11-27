# SW-Lab-U03_W08_D37_38-LootLogger-iter2
Second iteration of LootLogger App where we present a list of Item instances in a UITableView with custom table view cells that inherit form UITableViewCell


## Topics
1. Configure a `UITableViewCell` _**subclass**_  in storyboard
   - Give a style
   - Create an Identifier of the cell
   - Associate the `UITableViewCell` to a concrete class
   - Change cell height
   - Add labels to a cell
2. Create and connect outlets on _**custom cell views**_
3. Set table view’s fix row height programmatically
4. _**Compute cell heights dynamically**_ programmatically based on constraints
5. _**Dynamic Type**_ that provides specifically designed text styles for legibility optimization.
   - _**Text styles**_: 
      - `UIFont.TextStyle.body`
      - `UIFont.TextStyle.caption1`
   - _**User’s preferred text size**_ in association with _**text style**_ to get appropriately configured fonts. 


## Description
1. Second iteration of LootLogger App where we present a list of Item instances in a `UITableView` with _**custom table view cells**_ that inherit form `UITableViewCell`.
2. Bronze challenge: _**Cell colors**_
   - Update the `ItemCell` to display `Value_in_Dollars_Label` in green if the value is less than 50 and in red if the value is greater than or equal to 50. 
•	To resolve this specification, you should make use of Swift's _**Ternary Conditional Operator**_. 
. 
3. Silver challenge: _**Long item names**_
   - Currently, if the item’s name is long it will overlap with `Value_in_Dollars_Label`.
   - Update Item’s initializer in Item.swift to have an extra-long name. 
   - Fix this problem by allowing Name_Label to wrap to multiple lines if the name gets too long.
     - You will need to add at least one new constraint and allow the label to wrap multiple lines. 




https://user-images.githubusercontent.com/91871792/143296040-3f722779-2a53-406e-8164-31abe21dbb15.mp4


https://user-images.githubusercontent.com/91871792/143296155-e395ffb7-9124-4d1b-93a5-6e945c1a1472.mp4


https://user-images.githubusercontent.com/91871792/143296197-7d6f0b47-2b6a-4cd0-982a-9aecf879f101.mp4




## Deadline 
Thursday 25th November 9:15 am
