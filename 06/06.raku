#!/usr/bin/env raku
use v6.d;

unit sub MAIN (
        IO() :$input where *.f     = $?FILE.IO.sibling('input'),
        Int  :$part where * == 1|2 = 1, # Solve Part One or Part Two?
        --> Nil
);

sub result ( &code --> Int ) {
    $input.slurp.split("\n\n", :skip-empty).map(&code).sum;
}

given $part {
    when 1 {
        say result { .comb(/\S/).Set.elems };
    }
    when 2 {
        say result { .lines.map({ .comb(/\S/).Set }).reduce(&infix:<∩>).elems };
    }
}



