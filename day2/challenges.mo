import Int "mo:base/Int";
import Nat "mo:base/Nat";
import Char "mo:base/Char";
import Iter "mo:base/Iter";
import Text "mo:base/Text";
import Array "mo:base/Array";
import Buffer "mo:base/Buffer";
import List "mo:base/List";
import Debug "mo:base/Debug";

actor {
   /**
   * CC 01
   * Write a function average_array that takes an array of integers and 
   * returns the average value of the elements in the array.
   * dfx canister call motoko average_array 'vec {1;2;3;4;5}'
   */
  public query func average_array(array: [Int]) : async Int {
    var sum: Int = 0;
    for (i in array.vals()) {
      sum += i;
    };
    sum / array.size();
  };

  /**
  * CC 02
  * Character count: Write a function that takes in a string and a character, 
  * and returns the number of occurrences of that character in the string. ASCII 108 == l
  * dfx canister call motoko count_character '("helloWorld", 108)'
  */
  public query func count_character(t: Text, c: Char) : async Nat {
    var count: Nat = 0;
    for (i in t.chars()) {
      if (i == c) {
        count += 1;
      };
    };
    count;
  };


/**
* CC03
* Write a function factorial that takes a natural number n and returns the factorial of n.
* dfx canister call motoko factorial '(4)'
*/
  public query func factorial(n: Nat) : async Nat {
    var result: Nat = 1;
    for (i in Iter.range(1, n)) {
      result *= i;
    };
    result;
  };


  /**
   * CC 04
   * Write a function number_of_words that takes a sentence and 
   * returns the number of words in the sentence.
   * dfx canister call motoko number_of_words '("This is a sentence cool")'
   */
  public query func number_of_words(t: Text) : async Nat {
    var count: Nat = 0;
    var delimiter : Text = " ";
    let words = Text.split(t, #char ' ');
    Iter.iterate<Text>(words, func(x, _index) {
      count += 1;
    });
    count;
  };

  /**
   * CC 05
   * Write a function find_duplicates that takes an array of natural numbers and 
   * returns a new array containing all duplicate numbers. 
   * The order of the elements in the returned array should be the same as the order 
   * of the first occurrence in the input array.
   * dfx canister call motoko find_duplicates 'vec {1;2;1;4;5}'
   */
   
  public query func find_duplicates(a: [Nat]) : async [Nat] {
    // my internal counter 
    var num : Nat = 0;
    var current: Nat = 0;
    let arrayBuffer = Buffer.Buffer<Nat>(1);

    // (1) make alle Nat unique
    let uniqueArrayBuffer = Buffer.Buffer<Nat>(1);
    for (i in a.vals()) {
      if(Buffer.contains<Nat>(uniqueArrayBuffer, i, Nat.equal) == false){
        uniqueArrayBuffer.add(i);
      }
    };

    // (2) loop through the unique array and count the matches
    for (i in uniqueArrayBuffer.vals()) {
      // reset the counter
      num := 0;
      for(ii in a.vals()){
        // if we have a match
        if(i == ii){
          // count the match
          num += 1;
        };
      };
    
      if(num > 1){
        // add the match to the array
        arrayBuffer.add(i);
      }
       
    };
      //Debug.print("size of array "#debug_show(arrayBuffer.size()));
      //Debug.print("match "#debug_show(Buffer.toArray(arrayBuffer)));
      Buffer.toArray(arrayBuffer);
  };


  /**
   * CC 06
   * Write a function convert_to_binary that takes a natural number n and 
   * returns a string representing the binary representation of n.
   * dfx canister call motoko convert_to_binary '(4)'
   */
  public func convert_to_binary(n : Nat) : async Text {
    // finale text string
    var bitText : Text = "";
    
    // collect all
    var listOfBits = List.nil<Nat>();
    
    // use n as divided and set later the quotient as dividend
    var quotient : Nat = n;

    while (quotient > 0) {
      // get the result 0 or 1
      var r : Nat = quotient % 2;
      
      // set the new quotient as new divided
      quotient := quotient / 2;

      // push the result to a list (because I don't know a way to reverse a array!)
      listOfBits := List.push(r, listOfBits);
    };

    // Debug.print("> "#debug_show(listOfBits));  

    // convert the list to an array = reverse the list what is nice in this situation
    var arrayOfBits : [Nat] = List.toArray(listOfBits);

    // Debug.print("> "#debug_show(arrayOfBits));

    // loop over the arrayOfBits and concat the final text string
    for (value in arrayOfBits.vals()){
      bitText := bitText # Nat.toText(value);
    };

    return bitText;
  };
  
}