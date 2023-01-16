actor {
  /**
   * CC 01
   * Write a function multiply that takes 
   * two natural numbers and returns the product.
   *
   * dfx canister call motoko multiply '(2,2)'
   */
  public query func multiply(n1 : Nat, n2 : Nat) : async Nat {
    let result : Nat = n1 * n2;
  };

  /**
   * CC 02
   * Write a function volume that takes a natural number n and returns the volume of a cube with side length n.
   * dfx canister call motoko volume '(2)'
   */
  public query func volume(n : Nat) : async Nat {
    let result : Nat = n * n * n;
  };

  /**
   * CC 03
   * Write a function hours_to_minutes that takes a number of hours n and returns the number of minutes.
   * dfx canister call motoko hours_to_minutes '(2)'
   */
  public query func hours_to_minutes(n : Nat) : async Nat {
    let result : Nat = n * 60;
  };

  /**
   * CC 04
   * Write two functions set_counter & get_counter that take a natural number n and set/get the counter to n.
   * dfx canister call motoko set_counter '(2)'
   * dfx canister call motoko get_counter
   */
  var counter : Nat = 0;
  public func set_counter(n : Nat) : async () {
    counter := n;
  };
  public query func get_counter() : async Nat {
    counter;
  };

  /**
   * CC 05
   * Write a function test_divide that takes two natural numbers n and m and returns a boolean indicating if n divides m.
   * dfx canister call motoko test_divide '(2,4)'
   */
  public query func test_divide(n : Nat, m : Nat) : async Bool {
    let result : Bool = m % n == 0;
  };

  /**
   * CC 06
   * Write a function is_even that takes a natural number n and returns a boolean indicating if n is even.
   * dfx canister call motoko is_even '(2)'
   */
  public query func is_even(n : Nat) : async Bool {
    let result : Bool = n % 2 == 0;
  };
};