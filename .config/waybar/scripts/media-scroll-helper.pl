#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Encode qw(decode_utf8);
use Text::CharWidth qw(mbswidth);

binmode STDOUT, ':encoding(UTF-8)';

my $command = shift @ARGV // '';

sub width_of {
    my ($value) = @_;
    return mbswidth(decode_utf8($value // ''));
}

sub scroll_window {
    my ($text, $width, $pos) = @_;

    $text = decode_utf8($text // '') . '   ';
    my @chars = split //u, $text;
    my $length = scalar @chars;
    my $display_width = mbswidth($text);

    if ($display_width <= $width) {
        my $shown = $text . (' ' x ($width - $display_width));
        return ($pos, $shown);
    }

    my $used = 0;
    my $shown = '';
    my $start = $pos % $length;
    my $index = 0;

    while ($index < $length && $used < $width) {
        my $ch = $chars[($start + $index) % $length];
        my $ch_width = mbswidth($ch);
        last if $ch_width > 0 && ($used + $ch_width) > $width;
        $shown .= $ch;
        $used += $ch_width;
        $index++;
    }

    $shown .= ' ' x ($width - $used) if $used < $width;
    my $next_pos = ($start + 1) % $length;
    return ($next_pos, $shown);
}

if ($command eq 'width') {
    print width_of($ARGV[0]);
    exit 0;
}

if ($command eq 'scroll') {
    my ($next_pos, $shown) = scroll_window($ARGV[0], $ARGV[1], $ARGV[2]);
    print "$next_pos\n$shown\n";
    exit 0;
}

die "usage: $0 <width|scroll> ...\n";
