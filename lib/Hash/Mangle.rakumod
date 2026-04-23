unit class Hash::Mangle;

multi sub combine(Hash \a, \b --> Hash()) is export {
    (a.keys ∪ b.keys).keys
        .map: -> $k {
        $k =>
            (a{$k}:exists) &&
            (b{$k}:exists)
                ?? combine(a{$k}, b{$k})
                !! a{$k} // b{$k}
    }
}
multi sub combine(\a, \b --> Array()) is export {
    (|a, |b).unique
}

sub evert(%x) is export {
    my %h;
    for %x.kv -> $k, $v {
        for $v.unique -> $v {
            %h{$v} = $k;
        }
    }
    %h;
}
