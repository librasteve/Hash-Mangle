NAME
====

Hash::Mangle  - blah blah blah

SYNOPSIS
========

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

```raku
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

DESCRIPTION
===========

Hash::Mangle is ...

AUTHOR
======

librasteve <librasteve@furnival.net>

COPYRIGHT AND LICENSE
=====================

Copyright 2026 Stephen Roe 

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

