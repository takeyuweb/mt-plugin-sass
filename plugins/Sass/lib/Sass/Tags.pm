package Sass::Tags;

use strict;
use warnings;

use MT;

our $plugin = MT->component( 'Sass' );

sub hdlr_sass_setting {
    my ($ctx, $args) = @_;
    my $name = $args->{name};
    return '' unless $name;

    _get_system_setting( $name );
}

sub _get_system_setting {
    my ( $key ) = @_;
    my %plugin_param;
    $plugin->load_config( \%plugin_param, 'system' );
    
    $plugin_param{ $key };
}

sub _get_blog_setting {
    my ( $blog_id, $key ) = @_;
    my %plugin_param;

    $plugin->load_config( \%plugin_param, 'blog:'.$blog_id );

    $plugin_param{ $key };
}

sub hdlr_load_path {
    my ($ctx, $args) = @_;
    my $blog = $ctx->stash( 'blog' );
    return '' unless defined $blog;

    _get_blog_setting( $blog->id, 'sass_load_path' ) || $blog->site_path;
}


1;
