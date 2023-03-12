(*
 *  CS164 Fall 94
 *
 *  Programming Assignment 1
 *    Implementation of a simple stack machine.
 *
 *  Skeleton file
 *)

class Main inherits IO {
   convert : A2I <- new A2I;

   stack : List <- new List;

   flag : Bool <- true;

   main() : Object {
      while flag loop
      let char : String <- in_string() in {
		out_string("> ");
		if char = "e" then eval() else
		if char = "x" then stop() else
		if char = "d" then display() else
		stack <- stack.push(char)
		fi fi fi;
      } pool
   };

   eval() : Object {
      let top : String <- stack.head() in {
         if top = "+" then  {
		    pop();
		    let i : String, j : String in {
				i <- stack.head();
				pop();
				j <- stack.head();
				pop();
				stack.push(convert.i2a(convert.a2i(i) + convert.a2i(j)));
		    };
		 } else if top = "s" then {
		    pop();
		    let i : String, j : String in {
				i <- stack.head();
				pop();
				j <- stack.head();
				pop();
				stack.push(j);
				stack.push(i);
		    };
		 } else 0 fi fi;
      }
   };

   pop() : Object {
      stack <- stack.tail()
   };

   display() : Object {
      let tmp : List <- stack.copy() in {
		 while (not tmp.isNil()) loop {
		    out_string(tmp.head());
		    out_string("\n");
		    tmp <- tmp.tail();
		 } pool;
      }
   };

   stop() : Object {
      flag <- false
   };
};

class List {
    isNil() : Bool { true };

    head() : String { "" };

    tail() : List { { abort(); self; } };

    push(i : String) : List { (new Cons).init(i, self) };
};

class Cons inherits List {
    car: String;

    cdr: List;

    isNil() : Bool { false };

    head() : String { car };

    tail() : List { cdr };

    init(i : String, rest : List) : List {
		{
		    car <- i;
		    cdr <- rest;
		    self;
		}
    };
};
