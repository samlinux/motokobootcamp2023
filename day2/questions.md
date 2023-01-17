1. Who controls the ledger canister?
**Answer:**


2. What is the subnet of the canister with the id: mwrha-maaaa-aaaab-qabqq-cai? How much nodes are running this subnet?
**Answer:**
SubnetID: pae4o-o6dxf-xki7q-ezclx-znyd6-fnk6w-vkv5z-5lfwh-xym2i-otrrw-fqe
Nodes running: 16

3. Have a neuron with 1O ICPs locked with a dissolve delay of 4 years - my neuron has been locked for 2 years. What is my expected voting power?
**Answer:**


4. What is wrong with the following code?
```javascript
actor {
  let n : Nat = 50;
  let t : Text = "Hello";

  public func convert_to_text(m : Nat) : async Text {
    Nat.toText(m);
  };
 
}
```
**Answer:**
The n and t variable is not used.
The query prefix is missing, makes the code faster.
The import of the import Nat "mo:base/Nat"; is missing


5. What is wrong with the following code?
```JavaScript
actor {
  var languages : [var Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func show_languages(language : Text) : async [var Text] {
    return (languages);
  };
}
```
**Answer:**
If you want to return the languages array you have to remove the var declaration like below.

```JavaScript
var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];
  public query func show_languages(language : [Text]) : async [Text] {
    return (languages);
  };
```

6. What is wrong with the following code?
```JavaScript
actor {
  var languages : [Text] = ["English", "German", "Chinese", "Japanese", "French"];

  public func add_language(new_language: Text) : async [Text] {
    languages := Array.append<Text>(languages, [new_language]);
    return (languages);
  };
}
```
This code is working, but the Array.append method is deprecated and should be replaced with Buffer.
