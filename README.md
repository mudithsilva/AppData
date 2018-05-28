# AppData
Simple Swift file for store and retrieve User Defaults.

## Installation

Simply copy and paste AppData File on your Project :)

## Usage

#### Data Type

Data type should be in Codable. eg:- 

```
   import Foundation

    struct User: Codable {
    
        var name: String
        var email: String
    
    }
```

#### Save General Data types on User Defaults

``` 
AppData.storeData(data: "Hii", key: UserData(rawValue: UserData.postInfo.rawValue)) 
AppData.storeData(data: "Chathuranga", key: UserData(rawValue: UserData.userInfo.rawValue)) 
AppData.storeData(data: "Test", key: UserData(rawValue: UserData.commentInfo.rawValue)) 
```

You can add custome keys under UserData Enum type.

#### Retrieve General Data types on User Defaults

``AppData.getData(key: .postInfo)``


#### Save Codable Data on User Defaults

Use `` AppData.saveUserInformation(info: <#T##Decodable & Encodable#>, key: <#T##UserData.RawValue#>)`` for save data. eg :-

```
  let myUser = User(name: "Chathuranga",
                          email: "chathu@gmail.com")
  AppData.saveUserInformation(info: myUser, key: UserData.userInfo.rawValue)

```

#### Retrieve Codable Data on User Defaults

Use `` AppData.retrieveUserInformation(key: <#T##UserData.RawValue#>, type: <#T##(Decodable & Encodable).Protocol#>)`` for retrieve data. eg :-

```
  AppData.retrieveUserInformation(key: UserData.userInfo.rawValue, type: User.self)

```

