Feature: json feature testing 

Scenario: json reader

* def jsonObject = 
"""
[  
     {  
        "name": "sonoo",   
        "salary": 56000,   
        "married": true  
    } ,
      {  
        "name": "monu",   
        "salary": 31000,   
        "married": true  
    }
] 

"""

* print jsonObject
* print jsonObject[0].name
* print jsonObject[1].name +", " + jsonObject[1].salary +", " + jsonObject[1].married

Scenario: Complex json reader

* def jsonObject =
"""
{"menu": {
  "id": "file",
  "value": "File",
  "popup": {
    "menuitem": [
      {"value": "New", "onclick": "CreateNewDoc()"},
      {"value": "Open", "onclick": "OpenDoc()"},
      {"value": "Close", "onclick": "CloseDoc()"}
    ]
  }
}}
"""
* print jsonObject
* print jsonObject.menu.popup.menuitem[0]
* print jsonObject.menu.popup.menuitem[0].onclick
