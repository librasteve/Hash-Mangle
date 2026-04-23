NAME
====

Hash::Mangle  - blah blah blah

SYNOPSIS
========

### Ccmbine

Recursively combines Hash, Array and Scalar elements of two parent Hashes.

 - Requires both Hashes to have a similar structure.
 - Makes no attempt to upgrade Scalar to Array or Array to Hash.
 - Appends values from same keys (Hash - Hash).
 - Appends values (Array - Array).
 - Scalar and Positional values produce Array

```raku
use Hash::Mangle;

my %a = ( 
    foo => { x => 1, y => [1, 2] },
    bar => [3, 4], 
    baz => 42, 
);

my %b = ( 
    foo => { y => [3], z => 2 },
    bar => [5],
);

use Data::Dump::Tree;
ddt combine(%a, %b);
```

gives

```
{3} @0
├ bar => [3] @1
│ ├ 0 = 3
│ ├ 1 = 4
│ └ 2 = 5
├ baz => 42
└ foo => {3} @2
  ├ x => 1
  ├ y => [3] @3
  │ ├ 0 = 1
  │ ├ 1 = 2
  │ └ 2 = 3
  └ z => 2
```

### evert

A variant of invert that swaps keys and values. Array values produce multiple keys.

```raku
#normalized canonical data
my %a = (
    'real name' => <nick1 nick2>,
    'john doe' => ['johnny', 'johno'],
);
my %b = (
    'dave whom' => 'davie',
);

my %c = combine(%a, %b);
```

```commandline
{3} @0
├ dave whom => davie.Str
├ john doe => [2] @1
│ ├ 0 = johnny.Str
│ └ 1 = johno.Str
└ real name => (2) @2
  ├ 0 = nick1.Str
  └ 1 = nick2.Str
```

```raku
#denormalized reverse lookup
my %d = evert(%c);
```

```commandline
{5} @0
├ davie => dave whom.Str
├ johnny => john doe.Str
├ johno => john doe.Str
├ nick1 => real name.Str
└ nick2 => real name.Str
```


INSTALLATION
============

```commandline
zef install Hash::Mangle
```

AUTHOR
======

librasteve <librasteve@furnival.net>

COPYRIGHT AND LICENSE
=====================

Copyright 2026 Stephen Roe 

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

