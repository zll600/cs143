class List {
    isNil() : Bool { true };

    head() : String { "" };

    tail() : List { { abort(); self; } };

    push(i: String) : List { (new Cons).init(i.self) };
};

class Cons inherits List {
    car: String;

    cdr: String;

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
