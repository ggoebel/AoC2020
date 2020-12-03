use v6.d;

my @input = 'input'.IO.lines;
my @map;

for @input -> $line {
    @map.push(($line.comb xx *).flat);
}

sub detect_collisions (Int $sx, Int $sy) {
    my $rval = 0;
    loop (my ($x,$y)=($sx,$sy); $y < @map.elems; $x+=$sx, $y+=$sy) {
        $rval++ if @map[$y][$x] eq '#';
    }
    return $rval
}

# Part One
say "Part One: {detect_collisions(3,1)}";

# Part Two
my @collision;
for 1,1, 3,1, 5,1, 7,1, 1,2 -> $x, $y {
    @collision.push(detect_collisions($x, $y));
}
say "Part Two: " ~ [*] @collision;


