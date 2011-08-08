package Sass::Callbacks;

use strict;
use warnings;

sub hdlr_template_source_sass_config {
    my ( $cb, $app, $tmpl_ref ) = @_;
    my $blog_id = $app->param('blog_id');
    $$tmpl_ref =~ s/\[blog_id\]/$blog_id/g;
}

1;
