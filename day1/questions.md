# Questions

1. How much is the current memory capacity of a canister?
Answer: 
4 GB or
32 GB stable experimental memory 

There is really less information about this topic, found some infos on the forum !!!


2. What is the issue with the following code sample?
```javascript
actor {
  let counter : Nat = 0;
  public func increment_counter() : async () {
    counter := counter + 1;
  };
}
```
Answer:
The counter variable is set to immuntable because of the let declaration, change it to var and it will work.

3. What is the issue with the following code sample?
```bash 
actor {
  var message : Text = 0;

  public func change_message(new_message : Text) : async () {
    message := new_message;
    return;
  };
  
  public query func see_message() : async Text {
    return(message);
  };
}
```
Answer:
First, the variable message has a wrong inital value, change it to var message : Text = "";
Second, the public query func change_message function has the query prefix, wich is used for query some data in the way there is no change of the state. Remove this query prefix and it works.


4. False or True: We can remove the keyword async for return argument of a query function since queries are faster to answer.

Answer: 
false
